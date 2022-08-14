--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-rm-insert.sql

--Student ID: 32268513
--Student Name: Subhan Saadat Khan
--Unit Code: FIT3171
--Applied Class No: 2

/* Comments for your marker:




*/
--FINAL SUBMISSION
-- Task 2 Load the EMERCONTACT, COMPETITOR, ENTRY and TEAM tables with your own
-- test data following the data requirements expressed in the brief

-- =======================================
-- EMERCONTACT
INSERT INTO emercontact VALUES (
    '0169430227',
    'Subhan Saadat',
    'Khan'
);

INSERT INTO emercontact VALUES (
    '0834567224',
    'James',
    'Brown'
);

INSERT INTO emercontact VALUES (
    '0169907640',
    'Fahad',
    'Ahmed'
);

INSERT INTO emercontact VALUES (
    '0220089711',
    'Logan',
    'Paul'
);

INSERT INTO emercontact VALUES (
    '0984321111',
    'Eman Bin',
    'Mansoor'
);
-- =======================================


-- =======================================
-- COMPETITOR
INSERT INTO competitor VALUES (
    '1',
    'Umar',
    'Farooq',
    'M',
    to_date('11-Feb-2000','dd-Mon-yyyy'),
    'umarfarooq001@yahoo.com',
    'N', --> not a monash student
    '0310921080',
    'F',
    '0169430227' 
);

INSERT INTO competitor VALUES (
    '2',
    'Yahya',
    'Malik',
    'M',
    to_date('22-Nov-2001','dd-Mon-yyyy'), 
    'myka0001@student.monash.edu',
    'Y', 
    '0321324689',
    'F',
    '0169430227' 
);

INSERT INTO competitor VALUES (
    '3',
    'Zain',
    'Ali',
    'M',
    to_date('17-Jan-2005','dd-Mon-yyyy'), --> below 18
    'zainali554@gmail.com',
    'N', --> not in monash
    '0321324684',
    'F',
    '0169430227' 
);

INSERT INTO competitor VALUES (
    '4',
    'Erum',
    'Saadat',
    'F',
    to_date('04-Mar-2001','dd-Mon-yyyy'),
    'ersa0002@student.monash.edu',
    'Y', 
    '0199832187',
    'F',
    '0169430227' 
);

INSERT INTO competitor VALUES (
    '5',
    'Hina',
    'Furqaan',
    'F',
    to_date('18-Jun-1999','dd-Mon-yyyy'),
    'hina0003@student.monash.edu',
    'Y', 
    '0243256890',
    'F',
    '0169430227' 
);

INSERT INTO competitor VALUES (
    '6',
    'Jake',
    'Foley',
    'M',
    to_date('15-Jul-2005','dd-Mon-yyyy'), --> below 18
    'jakefoley55@gmail.com',
    'N',  --> not in monash
    '564732712',
    'G',
    '0834567224' 
);

INSERT INTO competitor VALUES (
    '7',
    'Jackson',
    'Water',
    'M',
    to_date('03-Dec-2000','dd-Mon-yyyy'),
    'jatr0004@student.monash.edu',
    'Y',  
    '0243256892',
    'G',
    '0834567224' 
);

INSERT INTO competitor VALUES (
    '8',
    'Maheen',
    'Kalu',
    'F',
    to_date('12-Dec-2000','dd-Mon-yyyy'),
    'mahu0005@student.monash.edu',
    'Y',  
    '0781234511',
    'G',
    '0834567224' 
);

INSERT INTO competitor VALUES (
    '9',
    'Chen',
    'Ting',
    'F',
    to_date('19-Aug-2001','dd-Mon-yyyy'),
    'chng0006@student.monash.edu',
    'Y',  
    '0163210853',
    'G',
    '0834567224' 
);

INSERT INTO competitor VALUES (
    '10',
    'Li',
    'Ching',
    'F',
    to_date('07-Feb-1999','dd-Mon-yyyy'),
    'licg0007@student.monash.edu',
    'Y',  
    '0781234513',
    'G',
    '0834567224' 
);

INSERT INTO competitor VALUES (
    '11',
    'Umair',
    'Rajput',
    'M',
    to_date('02-Mar-1998','dd-Mon-yyyy'),
    'umut0008@student.monash.edu',
    'Y',  
    '0121345678',
    'P',
    '0169907640' 
);

INSERT INTO competitor VALUES (
    '12',
    'Bisma',
    'Rajput',
    'F',
    to_date('20-Sep-2000','dd-Mon-yyyy'),
    'bmut0009@student.monash.edu',
    'Y',  
    '1345231230',
    'P',
    '0169907640' 
);

INSERT INTO competitor VALUES (
    '13',
    'Zubair',
    'Rajput',
    'M',
    to_date('21-Aug-1999','dd-Mon-yyyy'),
    'zbut0010@student.monash.edu',
    'Y',  
    '0557773212',
    'P',
    '0169907640' 
);

INSERT INTO competitor VALUES (
    '14',
    'Areeba',
    'Jameson',
    'F',
    to_date('08-Aug-2002','dd-Mon-yyyy'),
    'abon0011@student.monash.edu',
    'Y',  
    '4521340986',
    'T',
    '0220089711' 
);

INSERT INTO competitor VALUES (
    '15',
    'Justin',
    'Zack',
    'M',
    to_date('21-Aug-1999','dd-Mon-yyyy'),
    'jnck0012@student.monash.edu',
    'Y',  
    '1204532111',
    'T',
    '0984321111' 
);

-- =======================================

-- =======================================
-- ENTRY

--> event 10
INSERT INTO entry VALUES (
    10,
    1,
    TO_DATE('07:45','HH:MI'),
    TO_DATE('09:00','HH:MI'),
    10,
    null,
    4
);

INSERT INTO entry VALUES (
    10,
    2,
    TO_DATE('06:00','HH:MI'),
    TO_DATE('08:50','HH:MI'),
    7,
    null,
    4
);

INSERT INTO entry VALUES (
    10,
    3,
    TO_DATE('07:30','HH:MI'),
    TO_DATE('08:59','HH:MI'),
    14,
    null,
    4
);

INSERT INTO entry VALUES (
    10,
    4,
    TO_DATE('06:30','HH:MI'),
    TO_DATE('09:04','HH:MI'),
    4,
    null,
    4
);

INSERT INTO entry VALUES (
    10,
    5,
    TO_DATE('07:55','HH:MI'),
    TO_DATE('09:01','HH:MI'),
    8,
    null,
    4
);

--> event 11
INSERT INTO entry VALUES (
    11,
    6,
    TO_DATE('07:00','HH:MI'),
    TO_DATE('08:30','HH:MI'),
    6,
    null,
    2
);

INSERT INTO entry VALUES (
    11,
    7,
    TO_DATE('07:13','HH:MI'),
    TO_DATE('08:23','HH:MI'),
    1,
    null,
    2
);

INSERT INTO entry VALUES (
    11,
    8,
    TO_DATE('06:58','HH:MI'),
    TO_DATE('08:33','HH:MI'),
    9,
    null,
    2
);

INSERT INTO entry VALUES (
    11,
    9,
    TO_DATE('06:44','HH:MI'),
    TO_DATE('08:45','HH:MI'),
    12,
    null,
    2
);

--> event 7
INSERT INTO entry VALUES (
    7,
    1,
    TO_DATE('08:22','HH:MI'),
    TO_DATE('09:12','HH:MI'),
    10,
    null,
    3
);

INSERT INTO entry VALUES (
    7,
    6,
    TO_DATE('08:17','HH:MI'),
    TO_DATE('10:50','HH:MI'),
    6,
    null,
    3
);

INSERT INTO entry VALUES (
    7,
    7,
    TO_DATE('07:56','HH:MI'),
    TO_DATE('11:21','HH:MI'),
    1,
    null,
    3
);

--> event 9
INSERT INTO entry VALUES (
    9,
    3,
    TO_DATE('07:05','HH:MI'),
    TO_DATE('10:21','HH:MI'),
    14,
    null,
    1
);

INSERT INTO entry VALUES (
    9,
    8,
    TO_DATE('07:37','HH:MI'),
    TO_DATE('10:54','HH:MI'),
    9,
    null,
    1
);

INSERT INTO entry VALUES (
    9,
    9,
    TO_DATE('07:52','HH:MI'),
    TO_DATE('11:01','HH:MI'),
    12,
    null,
    1
);

INSERT INTO entry VALUES (
    9,
    4,
    TO_DATE('07:59','HH:MI'),
    TO_DATE('11:12','HH:MI'),
    4,
    null,
    1
);

--> event 14
INSERT INTO entry VALUES (
    14,
    1,
    TO_DATE('06:38','HH:MI'),
    TO_DATE('09:33','HH:MI'),
    10,
    null,
    null
);

INSERT INTO entry VALUES (
    14,
    7,
    TO_DATE('07:46','HH:MI'),
    TO_DATE('09:59','HH:MI'),
    1,
    null,
    null
);

INSERT INTO entry VALUES (
    14,
    8,
    TO_DATE('07:27','HH:MI'),
    TO_DATE('10:17','HH:MI'),
    9,
    null,
    null
);

--> event 1
INSERT INTO entry VALUES (
    1,
    3,
    TO_DATE('09:22','HH:MI'),
    TO_DATE('11:47','HH:MI'),
    14,
    null,
    1
);

INSERT INTO entry VALUES (
    1,
    10,
    TO_DATE('09:28','HH:MI'),
    TO_DATE('11:14','HH:MI'),
    3,
    null,
    1
);

INSERT INTO entry VALUES (
    1,
    11,
    null,
    null,
    5,
    null,
    null
);

INSERT INTO entry VALUES (
    1,
    6,
    TO_DATE('09:10','HH:MI'),
    TO_DATE('11:29','HH:MI'),
    6,
    null,
    1
);

INSERT INTO entry VALUES (
    1,
    5,
    TO_DATE('08:55','HH:MI'),
    TO_DATE('10:51','HH:MI'),
    8,
    null,
    1
);

INSERT INTO entry VALUES (
    1,
    12,
    TO_DATE('08:09','HH:MI'),
    TO_DATE('10:18','HH:MI'),
    15,
    null,
    1
);

--> event 4
INSERT INTO entry VALUES (
    4,
    1,
    TO_DATE('08:22','HH:MI'),
    TO_DATE('9:44','HH:MI'),
    10,
    null,
    4
);

INSERT INTO entry VALUES (
    4,
    2,
    TO_DATE('08:04','HH:MI'),
    TO_DATE('10:33','HH:MI'),
    7,
    null,
    4
);

INSERT INTO entry VALUES (
    4,
    12,
    null,
    null,
    15,
    null,
    null
);

INSERT INTO entry VALUES (
    4,
    9,
    TO_DATE('08:07','HH:MI'),
    TO_DATE('10:16','HH:MI'),
    12,
    null,
    4
);

INSERT INTO entry VALUES (
    4,
    6,
    TO_DATE('07:21','HH:MI'),
    TO_DATE('11:43','HH:MI'),
    6,
    null,
    4
);

-- =======================================


-- =======================================
-- TEAM
INSERT INTO team VALUES (
    1,
    'Star Warriors',
    to_date('14-Mar-2022','dd-Mon-yyyy'),
    5,
    10,
    1,
    4
);

INSERT INTO team VALUES (
    2,
    'Hustlers',
    to_date('14-Mar-2022','dd-Mon-yyyy'),
    4,
    11,
    7,
    2
);
--
INSERT INTO team VALUES (
    3,
    'Zeus',
    to_date('05-Feb-2022','dd-Mon-yyyy'),
    3,
    7,
    6,
    3
);
--
INSERT INTO team VALUES (
    4,
    'Lion Heart',
    to_date('05-Feb-2022','dd-Mon-yyyy'),
    4,
    9,
    9,
    1
);

INSERT INTO team VALUES (
    5,
    'Hustlers',
    to_date('29-May-2022','dd-Mon-yyyy'),
    3,
    14,
    8,
    null
);
--
INSERT INTO team VALUES (
    6,
    'Water Benders',
    to_date('24-Sep-2021','dd-Mon-yyyy'),
    5,
    1,
    12,
    1
);

INSERT INTO team VALUES (
    7,
    'Fire Blazers',
    to_date('01-Oct-2021','dd-Mon-yyyy'),
    4,
    4,
    2,
    4
);



UPDATE entry SET team_id = 1 WHERE event_id = 10;
UPDATE entry SET team_id = 2 WHERE event_id = 11;
UPDATE entry SET team_id = 3 WHERE event_id = 7;
UPDATE entry SET team_id = 4 WHERE event_id = 9;
UPDATE entry SET team_id = 5 WHERE event_id = 14;
UPDATE entry SET team_id = 6 WHERE event_id = 1;
UPDATE entry SET team_id = 7 WHERE event_id = 4;

COMMIT;
-- =======================================