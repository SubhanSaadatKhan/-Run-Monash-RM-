--****PLEASE ENTER YOUR DETAILS BELOW****
--T1-rm-schema.sql

--Student ID: 32268513
--Student Name: Subhan Saadat Khan
--Unit Code: FIT3171
--Applied Class No: 2

/* Comments for your marker:




*/
--FINAL SUBMISSION
-- Task 1 Add Create table statements for the Missing TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- COMPETITOR
CREATE TABLE competitor (
    comp_no                 NUMERIC(5) NOT NULL,
    comp_fname              VARCHAR2(30),
    comp_lname              VARCHAR2(30),
    comp_gender             CHAR(1) NOT NULL,
    comp_dob                DATE NOT NULL,
    comp_email              VARCHAR2(50) NOT Null,
    comp_unistatus          CHAR(1) NOT NULL,
    comp_phone              CHAR(10) NOT NULL,
    comp_ec_relationship    CHAR(1) NOT NULL,
    ec_phone                Char(10) NOT NULL,
    
    CONSTRAINT competitor_pk PRIMARY KEY ( comp_no ),
    
    CONSTRAINT chk_comp_gender CHECK ( comp_gender IN (
        'M',
        'F',
        'U'
    ) ),
    
    CONSTRAINT unq_comp_email UNIQUE ( comp_email ),
    
    CONSTRAINT chk_comp_unistatus CHECK ( comp_unistatus IN (
        'Y',
        'N'
    ) ),
    
    CONSTRAINT unq_comp_phone UNIQUE ( comp_phone ),
    
    CONSTRAINT ck_comp_ec_relationship CHECK ( comp_ec_relationship IN (
        'P',
        'G',
        'T',
        'F'
    ) )
);

COMMENT ON COLUMN competitor.comp_no IS
    'Unique identifier for a competitor';
    
COMMENT ON COLUMN competitor.comp_fname IS
    'Competitor’s first name';
    
COMMENT ON COLUMN competitor.comp_lname IS
    'Competitor’s last name';
    
COMMENT ON COLUMN competitor.comp_gender IS
    'Competitor’s gender ("M" for male, "F"’ for female, or "U" for
"Undisclosed")';
    
COMMENT ON COLUMN competitor.comp_dob IS
    'Competitor’s date of birth';
    
COMMENT ON COLUMN competitor.comp_email IS
    'Competitor’s email';
    
COMMENT ON COLUMN competitor.comp_unistatus IS
    'Competitor’s university student/staff status ("Y" for Yes or
"N" for No)';
    
COMMENT ON COLUMN competitor.comp_phone IS
    'Competitor’s phone number';
    
COMMENT ON COLUMN competitor.comp_ec_relationship IS
    'Emergency contact relationship to competitor (‘P’ for
Parent, ‘G’ for Guardian, ‘T’ for Partner, or ‘F’ for Friend)';

COMMENT ON COLUMN competitor.ec_phone IS
    'Emergency contact’s phone number (unique identifier)';

-- EMERCONTACT
CREATE TABLE emercontact (
    ec_phone   CHAR(10) NOT NULL,
    ec_fname   VARCHAR2(30),
    ec_lname   VARCHAR2(30),
    
    CONSTRAINT emercontact_pk PRIMARY KEY ( ec_phone )
);

COMMENT ON COLUMN emercontact.ec_phone IS
    'Emergency contact’s phone number (unique identifier)';
    
COMMENT ON COLUMN emercontact.ec_fname IS
    'Emergency contact’s first name';
    
COMMENT ON COLUMN emercontact.ec_lname IS
    'Emergency contact’s last name';

--ENTRY
CREATE TABLE entry (
    event_id            NUMERIC(6) NOT NULL,
    entry_no            NUMERIC(5) NOT NULL,
    entry_starttime     DATE,
    entry_finishtime    DATE,
    comp_no             NUMERIC(5) NOT NULL,
    team_id             NUMERIC(3),
    char_id             NUMERIC(3),
    
    CONSTRAINT entry_pk PRIMARY KEY ( event_id , entry_no )

);

COMMENT ON COLUMN entry.event_id IS
    'Event id (surrogate primary key)';
    
COMMENT ON COLUMN entry.entry_no IS
    'Entry number (unique for each event)';
    
COMMENT ON COLUMN entry.entry_starttime IS
    'The entrant start time';
    
COMMENT ON COLUMN entry.entry_finishtime IS
    'The entrant finish time';
    
COMMENT ON COLUMN entry.comp_no IS
    'Unique identifier for a competitor';
    
COMMENT ON COLUMN entry.team_id IS
    'Team identifier (unique)';
    
COMMENT ON COLUMN entry.char_id IS
    'Charity unique identifier';

--TEAM
CREATE TABLE team (
    team_id         NUMERIC(3) NOT NULL,
    team_name       VARCHAR(30) NOT NULL,
    carn_date       DATE NOT NULL,
    team_no_members Numeric(2) NOT NULL,
    event_id        NUMERIC(6) NOT NULL,
    entry_no        NUMERIC(5) NOT NULL,
    char_id         NUMERIC(3),
    
    CONSTRAINT team_pk PRIMARY KEY ( team_id ),
    CONSTRAINT unq_team_name_carn_date UNIQUE ( team_name,carn_date )
);

COMMENT ON COLUMN team.team_id IS
    'Team identifier (unique)';

COMMENT ON COLUMN team.team_name IS
    'Team name';
    
COMMENT ON COLUMN team.carn_date IS
    'Date of carnival (unique identifier)';
    
COMMENT ON COLUMN team.team_no_members IS
    'Number of team members';

COMMENT ON COLUMN team.event_id IS
    'Event id (surrogate primary key)';
    
COMMENT ON COLUMN team.entry_no IS
    'Entry number (unique for each event)';
    
COMMENT ON COLUMN team.char_id IS
    'Charity unique identifier';

-- Add all missing FK Constraints below here

-- ADDING FK Constraints for table COMPETITOR
ALTER TABLE competitor
    ADD CONSTRAINT emercontact_competitor_fk FOREIGN KEY ( ec_phone )
        REFERENCES emercontact ( ec_phone );
        
        
-- ADDING FK Constraints for table ENTRY
ALTER TABLE entry
    ADD CONSTRAINT event_entry_fk FOREIGN KEY ( event_id )
        REFERENCES event ( event_id );   
        
ALTER TABLE entry
    ADD CONSTRAINT competitor_entry_fk FOREIGN KEY ( comp_no )
        REFERENCES competitor ( comp_no );  
        
ALTER TABLE entry
    ADD CONSTRAINT team_entry_fk FOREIGN KEY ( team_id )
        REFERENCES team ( team_id );  
        
ALTER TABLE entry
    ADD CONSTRAINT charity_entry_fk FOREIGN KEY ( char_id )
        REFERENCES charity ( char_id );          
        
        
-- ADDING FK Constraints for table TEAM
ALTER TABLE team
    ADD CONSTRAINT carnival_team_fk FOREIGN KEY ( carn_date )
        REFERENCES carnival ( carn_date );   
                
ALTER TABLE team
    ADD CONSTRAINT entry_team_fk FOREIGN KEY ( entry_no,event_id )
        REFERENCES entry ( entry_no,event_id );  
        
ALTER TABLE team
    ADD CONSTRAINT charity_team_fk FOREIGN KEY ( char_id )
        REFERENCES charity ( char_id );          
        
