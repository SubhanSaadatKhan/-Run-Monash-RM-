--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-rm-dm.sql

--Student ID: 32268513
--Student Name: Subhan Saadat Khan
--Unit Code: FIT3171
--Applied Class No: 2

/* Comments for your marker:




*/
--FINAL SUBMISSION
--3(a)
--> for competitor
DROP SEQUENCE competitor_seq;
CREATE SEQUENCE competitor_seq START WITH 100 INCREMENT BY 1;

-->for team
DROP SEQUENCE team_seq;
CREATE SEQUENCE team_seq START WITH 100 INCREMENT BY 1;


--3(b)
INSERT INTO emercontact VALUES (
    '0476541234',
    'Jack',
    'Kai'
);

INSERT INTO competitor VALUES (
    competitor_seq.NEXTVAL,
    'Daniel',
    'Kai',
    'M',
    to_date('12-Jan-2000','dd-Mon-yyyy'),
    'daai0013@student.monash.edu',
    'Y', 
    '0412324546',
    'F',
    '0476541234' 
);



INSERT INTO entry VALUES (
    ( 
        SELECT
            event_id
        FROM
            event
        WHERE
            eventtype_code = 
            (SELECT eventtype_code 
             FROM eventtype 
             WHERE eventtype_desc = '21.1 Km Half Marathon' AND carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022')  )      
    ),
    (
        SELECT MAX(entry_no) + 1 FROM entry 
    ),
    null,
    null,
    competitor_seq.CURRVAL,
    null,
    (
        SELECT
            char_id
        FROM
            charity
        WHERE
            char_name = 'Beyond Blue'
    )
);

INSERT INTO competitor VALUES (
    competitor_seq.NEXTVAL,
    'Annabelle',
    'Kai',
    'F',
    to_date('15-Aug-2002','dd-Mon-yyyy'),
    'anai0014@student.monash.edu',
    'Y', 
    '0467125600',
    'F',
    '0476541234' 
);


INSERT INTO entry VALUES (
    ( 
        SELECT
            event_id
        FROM
            event
        WHERE
            eventtype_code = 
            (SELECT eventtype_code 
             FROM eventtype 
             WHERE eventtype_desc = '21.1 Km Half Marathon' AND carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022')  )      
    ),
    (
        SELECT MAX(entry_no) + 1 FROM entry 
    ),
    null,
    null,
    competitor_seq.CURRVAL,
    null,
    (
        SELECT
            char_id
        FROM
            charity
        WHERE
            char_name = 'Amnesty International'
    )
);
COMMIT;


--3(c)
INSERT INTO team VALUES (
    team_seq.NEXTVAL,
    'Kai Speedstars',
    (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022'),
    1,
    ( 
        SELECT
            event_id
        FROM
            entry
        WHERE
            comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Annabelle' AND comp_lname = 'Kai')  AND event_id IN (SELECT event_id FROM event WHERE carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022'))  
    ),
    (
        SELECT 
            entry_no
        FROM 
            entry
        WHERE 
            comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Annabelle' AND comp_lname = 'Kai')  AND event_id IN (SELECT event_id FROM event WHERE carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022'))  
            
    ),
    (
        SELECT
            char_id
        FROM
            charity
        WHERE
            char_name = 'Beyond Blue'
    )
);

UPDATE entry
SET team_id = team_seq.CURRVAL
WHERE comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Annabelle' AND comp_lname = 'Kai')  AND event_id IN (SELECT event_id FROM event WHERE carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022'))  ;

COMMIT;

--3(d)
UPDATE entry
SET event_id = ( SELECT event_id FROM event WHERE eventtype_code = (SELECT eventtype_code FROM eventtype WHERE eventtype_desc = '10 Km Run' AND carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022')  )      )
WHERE comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Daniel' AND comp_lname = 'Kai') AND event_id = ( SELECT event_id FROM event WHERE eventtype_code = (SELECT eventtype_code FROM eventtype WHERE eventtype_desc = '21.1 Km Half Marathon' AND carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022')  )      );

UPDATE team
SET team_no_members = ( SELECT team_no_members FROM team WHERE team_name = 'Kai Speedstars' AND carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022')) + 1
WHERE team_name = 'Kai Speedstars' AND carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022');

COMMIT;

----3(e)
DELETE FROM entry 
WHERE comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Daniel' AND comp_lname = 'Kai');

UPDATE entry
SET team_id = NULL,char_id = (SELECT char_id FROM charity WHERE char_name = 'Beyond Blue')
WHERE comp_no = (SELECT comp_no FROM competitor WHERE comp_fname = 'Annabelle' AND comp_lname = 'Kai')  AND event_id IN (SELECT event_id FROM event WHERE carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022'))  ;

DELETE FROM team
WHERE team_name = 'Kai Speedstars' AND carn_date = (SELECT carn_date FROM carnival WHERE carn_name = 'RM Autumn Series Caulfield 2022');

COMMIT;
