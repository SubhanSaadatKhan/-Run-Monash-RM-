--****PLEASE ENTER YOUR DETAILS BELOW****
--T5-rm-alter.sql

--Student ID: 32268513
--Student Name: Subhan Saadat Khan
--Unit Code: FIT3171
--Applied Class No: 2

/* Comments for your marker:




*/
--FINAL SUBMISSION
SET SERVEROUTPUT ON;

--5(a)
CREATE OR REPLACE TRIGGER add_entry_check
BEFORE INSERT ON ENTRY
FOR EACH ROW

DECLARE chk_num NUMERIC (2);

begin
    SELECT count(*) INTO chk_num FROM entry INNER JOIN event ON entry.event_id = event.event_id WHERE entry_no = :new.entry_no AND carn_date = (SELECT carn_date FROM event WHERE event_id = :new.event_id);
    if(chk_num>0) then
        raise_application_error(-20000,'Insert error: This competitor has already enrolled in this carnival');
    end if;
end;
/

-- Test Harness for 5(a) --

-- Prior state
SELECT * FROM ENTRY;

-- Test trigger - insert competitor first time in a carnival - passed
insert into entry values (11,16,null,null,2,null,null,null);

-- Post state
SELECT * FROM ENTRY;

-- Test trigger - insert competitor same event same carnival - failed
insert into entry values (11,16,null,null,2,null,null,null);

-- Post state
SELECT * FROM ENTRY;

-- Test trigger - insert competitor different event same carnival - failed
insert into entry values (10,16,null,null,2,null,null,null);

-- Post state
SELECT * FROM ENTRY;

ROLLBACK;

--5(b)
ALTER TABLE eventtype
ADD eventype_record NUMERIC(6,2) DEFAULT NULL;

ALTER TABLE eventtype
ADD eventtype_recordholder NUMERIC(5) DEFAULT NULL;

CREATE OR REPLACE TRIGGER add_eventtype_check
AFTER UPDATE OF entry_finishtime ON entry
FOR EACH ROW
DECLARE 
    prev_time NUMERIC (6,2); 
    current_fastest_time NUMERIC(6,2);


begin
    -- calculate part
    current_fastest_time := (((:new.entry_finishtime -  :new.entry_starttime))*24)*60;
    
    -- update part
    SELECT eventype_record INTO prev_time FROM eventtype WHERE eventtype_code = (SELECT eventtype_code From event WHERE event_id = :new.event_id); 
    
    IF (prev_time is null OR prev_time>current_fastest_time) THEN
        UPDATE eventtype
            SET eventype_record = current_fastest_time,eventtype_recordholder = :new.comp_no
            WHERE eventtype_code = (SELECT eventtype_code FROM event WHERE event_id = :new.event_id);
        dbms_output.put_line ('Fastest elapsed time for this event has been updated');    
    end if;        

end;
/

-- Test harness for 5(b)
insert into entry values (13,3,TO_DATE('08:30','HH:MI'),null,14,null,null,null);
insert into entry values (13,6,TO_DATE('08:30','HH:MI'),null,6,null,null,null);
insert into entry values (13,5,TO_DATE('08:30','HH:MI'),null,8,null,null,null);

-- Prior state
select * from entry;
select * from eventtype;

-- Test trigger - update competitor finish time, since the initial eventtype_record for this event is null, thus it will update - passed
UPDATE entry
SET entry_finishtime = TO_DATE('09:00','HH:MI')
WHERE event_id = 13 AND comp_no = 14;

-- Post state
select * from eventtype;

-- Test trigger - update competitor finish time, since the elapse time for this competitor is more than the previous competitor thus eventtype_record will not update - failed
UPDATE entry
SET entry_finishtime = TO_DATE('09:20','HH:MI')
WHERE event_id = 13 AND comp_no = 6;

-- Post state
select * from eventtype;

-- Test trigger - update competitor finish time, since the elapse time for this competitor is less than the previous competitor thus eventtype_record will update - passed
UPDATE entry
SET entry_finishtime = TO_DATE('08:50','HH:MI')
WHERE event_id = 13 AND comp_no = 8;

-- Post state
select * from eventtype;

ROLLBACK;

--5(c)
CREATE OR REPLACE PROCEDURE event_registration (
    in_comp_no        IN NUMBER,
    in_carn_date      IN Date,
    in_eventtype_desc IN VARCHAR2,
    in_team_name      IN VARCHAR2,
    out_message       OUT VARCHAR2
) AS
    var_carn_date_found   NUMBER;
    var_eventtype_desc_found NUMBER;
    var_team_name_found NUMBER;
BEGIN
    SELECT
        COUNT(*)
    INTO var_carn_date_found
    FROM
        carnival
    WHERE
        carn_date = in_carn_date;
        
    SELECT
        COUNT(*)
    INTO var_eventtype_desc_found
    FROM
        eventtype
    WHERE
        eventtype_desc = in_eventtype_desc;
        
    IF ( var_carn_date_found = 0 ) THEN
        out_message := 'Invalid carnival date, new event registration process cancelled';
    ELSE
            
        IF ( var_eventtype_desc_found = 0 ) THEN
            out_message := 'Invalid event name, new event registration process cancelled';
        ELSE
            INSERT INTO entry(
                event_id,
                entry_no,
                comp_no
            )
            VALUES (
            (SELECT event_id From event WHERE carn_date = in_carn_date AND eventtype_code = (SELECT eventtype_code from eventtype WHERE eventtype_desc = in_eventtype_desc)),
            (SELECT MAX(entry_no) + 1 FROM entry),
            in_comp_no
            );
            IF(in_team_name IS NOT NULL) THEN
                        
                SELECT
                    COUNT(*)
                INTO var_team_name_found
                FROM
                    team
                WHERE
                    team_name = in_team_name AND carn_date = in_carn_date;
                  
                IF ( var_team_name_found = 0 ) THEN
                
                    INSERT INTO team(
                        team_id,
                        team_name,
                        carn_date,
                        team_no_members,
                        event_id,
                        entry_no
                    )
                    VALUES (
                        team_seq.NEXTVAL,
                        in_team_name,
                        in_carn_date,
                        1,
                        (SELECT event_id From event WHERE carn_date = in_carn_date AND eventtype_code = (SELECT eventtype_code from eventtype WHERE eventtype_desc = in_eventtype_desc)),
                        (SELECT MAX(entry_no) FROM entry)
                    );
                    out_message := 'Successfully registered, new team created';
                ELSE    
                    UPDATE team
                    SET team_no_members = (SELECT team_no_members FROM team WHERE team_name = in_team_name AND carn_date = in_carn_date) + 1
                    WHERE team_name = in_team_name AND carn_date = in_carn_date;
                    out_message := 'Successfully registered, competitor added into an existing team';
               END IF;
           END IF;
          END IF;
         END IF; 
END event_registration;
/                   
                    

-- Test Harness for 5(c)

--before value
select * from competitor
where comp_no = 2;
select * from entry
where comp_no = 2;

--execute the procedure 
DECLARE
    output VARCHAR2(200);
BEGIN
    --call the procedure - invalid since this carnival date does not exist
    event_registration(2,TO_DATE('15/JUL/2022', 'DD/MON/YYYY'),'21.1 Km Half Marathon','Romeo',output);
    dbms_output.put_line(output);
END;
/

--execute the procedure 
DECLARE
    output VARCHAR2(200);
BEGIN
    --call the procedure - invalid since this event name does not exist
    event_registration(2,TO_DATE('29/May/2022', 'DD/MON/YYYY'),'Happy race 24/7','Sleeping',output);
    dbms_output.put_line(output);
END;
/
-- Pre state
select * from team;

--execute the procedure 
DECLARE
    output VARCHAR2(200);
BEGIN
    --call the procedure - valid and added to an existing team
    event_registration(2,TO_DATE('05/FEB/2022', 'DD/MON/YYYY'),'5 Km Run','Zeus',output);
    dbms_output.put_line(output);
END;
/
-- Post state
select * from team;


ROLLBACK;