--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-rm-alter.sql

--Student ID: 32268513
--Student Name: Subhan Saadat Khan
--Unit Code: FIT3171
--Applied Class No: 2

/* Comments for your marker:
In task 4b only the teams that donate to 1 or more charities will be added in the charity_support table

In task 4c sinc ethe list of roles may be expanded therefore, I used a Lookup table for the roles


*/
--FINAL SUBMISSION
--4(a)
ALTER TABLE entry
ADD elapsed_time NUMERIC(6,2);

UPDATE entry 
SET elapsed_time =  (((entry_finishtime -  entry_starttime))*24)*60          
WHERE entry_starttime IS NOT NULL OR entry_finishtime IS NOT NULL;

--4(b)


DROP TABLE charity_support CASCADE CONSTRAINTS;

CREATE TABLE charity_support 
    AS
        SELECT
            team_id,char_id
        FROM
            team
        WHERE 
            char_id IS NOT NULL;  --> Not allow teams who do not do charity inside this table
            
ALTER TABLE team
DROP COLUMN char_id;            

ALTER TABLE charity_support
ADD char_supp_raised_funds_perc NUMERIC(3) DEFAULT 100;

            
COMMENT ON COLUMN charity_support.team_id IS
    'Team identifier (unique)';
    
COMMENT ON COLUMN charity_support.char_id IS
    'Charity unique identifier';
    
COMMENT ON COLUMN charity_support.char_supp_raised_funds_perc IS
    'Percentage of funds raised';   
    
ALTER TABLE charity_support
    ADD CONSTRAINT charity_support_pk PRIMARY KEY ( team_id , char_id ); 
    
ALTER TABLE charity_support
    ADD CONSTRAINT chk_char_supp_raised_funds_perc CHECK ( char_supp_raised_funds_perc < 101 AND char_supp_raised_funds_perc > 0 ); 
    
ALTER TABLE charity_support
    ADD CONSTRAINT charity_support_team_fk FOREIGN KEY ( team_id )
        REFERENCES team ( team_id );       

ALTER TABLE charity_support
    ADD CONSTRAINT charity_support_charity_fk FOREIGN KEY ( char_id )
        REFERENCES charity ( char_id );
         
--4(c)

DROP TABLE official CASCADE CONSTRAINTS;

CREATE TABLE official (
    offi_id       NUMERIC(5) NOT NULL,
    comp_no       NUMERIC(5),
    
    CONSTRAINT official_pk PRIMARY KEY ( offi_id )
);

COMMENT ON COLUMN official.offi_id IS
    'Unique identifier for a official';    
    
COMMENT ON COLUMN official.comp_no IS
    'Unique identifier for a competitor'; 
    
DROP TABLE carnival_official CASCADE CONSTRAINTS;

CREATE TABLE carnival_official (
    carn_date            DATE NOT NULL,
    offi_id              NUMERIC(5) NOT NULL,
    carn_offi_role_no    NUMERIC(3) NOT NULL,
    
    CONSTRAINT carnival_official_pk PRIMARY KEY ( carn_date,offi_id )
);    

COMMENT ON COLUMN carnival_official.carn_date IS
    'Date of carnival (unique identifier)';
    
COMMENT ON COLUMN carnival_official.offi_id IS
    'Unique identifier for a official';
    
COMMENT ON COLUMN carnival_official.carn_offi_role_no IS
    'Unique identifier for a officials role';   
    
DROP TABLE carnival_official_role CASCADE CONSTRAINTS;

CREATE TABLE carnival_official_role (  -->A Lookup table
    carn_offi_role_no         NUMERIC(3) NOT NULL,
    carn_offi_role_desc       VARCHAR2(20) NOT NULL,
    
    CONSTRAINT carnival_official_role_pk PRIMARY KEY ( carn_offi_role_no )
); 

COMMENT ON COLUMN carnival_official_role.carn_offi_role_no IS
    'Unique identifier for a officials role'; 
    
COMMENT ON COLUMN carnival_official_role.carn_offi_role_desc IS
    'Officials role description in a carnival';     
    
--> Foreign constraint of official table    
ALTER TABLE official
    ADD CONSTRAINT official_competitor_fk FOREIGN KEY ( comp_no )
        REFERENCES competitor ( comp_no );
    
--> Foreign constraint of carnival_official table        
ALTER TABLE carnival_official
    ADD CONSTRAINT carnival_official_carnival_fk FOREIGN KEY ( carn_date )
        REFERENCES carnival ( carn_date );   
        
ALTER TABLE carnival_official
    ADD CONSTRAINT carnival_official_official_fk FOREIGN KEY ( offi_id )
        REFERENCES official ( offi_id );      
        
ALTER TABLE carnival_official
    ADD CONSTRAINT carnival_official_carnival_official_role_fk FOREIGN KEY ( carn_offi_role_no )
        REFERENCES carnival_official_role ( carn_offi_role_no );            
