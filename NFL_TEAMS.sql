CREATE TABLE NFL_TEAMS (
TEAM_NAME VARCHAR(20) NOT NULL,
CONFERENCE CHAR(3),
DIVISION VARCHAR(8),
CITY VARCHAR(20),
STATE CHAR(2),
OWNER VARCHAR(40),
HEAD_COACH VARCHAR(20),
SUPER_BOWL_WINS INT,
PRIMARY KEY(TEAM_NAME)
);

CREATE TABLE AFC (
TEAM_NAME VARCHAR(20),
DIVISION VARCHAR(5),
FOREIGN KEY (TEAM_NAME) REFERENCES NFL_TEAMS(TEAM_NAME)
);
	
CREATE TABLE NFC (
TEAM_NAME VARCHAR(20),
DIVISION VARCHAR(5),
FOREIGN KEY (TEAM_NAME) REFERENCES NFL_TEAMS(TEAM_NAME)
);

CREATE TABLE AFC_NORTH (
TEAM_NAME VARCHAR(20),
HEAD_COACH VARCHAR(20),
CITY VARCHAR(20),
STATE CHAR(2),
FOREIGN KEY (TEAM_NAME) REFERENCES NFL_TEAMS(TEAM_NAME)
);

INSERT INTO NFL_TEAMS (TEAM_NAME, CONFERENCE, DIVISION, CITY, STATE, OWNER, HEAD_COACH, SUPER_BOWL_WINS)
VALUES
	('Dallas Cowboys', 'NFC', 'East', 'Dallas', 'TX', 'JerryJones', 'BillBelichick', 5),
	('New England Patriots', 'AFC', 'East', 'Foxborough', 'MA', 'RobertKraft', 'SeanMcVay', 6),
	('Atlanta Falcons', 'NFC', 'South', 'Atlanta', 'GA', 'ArthurBlank', 'AndyReid', 0),
	('Buffalo Bills', 'AFC', 'East', 'Buffalo', 'NY', 'TerryPegula', 'SeanDermott', 0),
	('Miami Dolphins', 'AFC', 'East', 'Miami', 'FL', 'StephenRoss', 'BrianFlores', 0),
    ('San Francisco 49ers', 'NFC', 'West', 'Santa Clara', 'CA', 'JedYork', 'KyleShanahan', 5),
    ('Seattle Seahawks', 'NFC', 'West', 'Seattle', 'WA', 'JodyAllen', 'PeteCarroll', 1),
    ('Kansas City Chiefs', 'AFC', 'West', 'Kansas City', 'MO', 'ClarkHunt', 'AndyReid', 2),
    ('Denver Broncos', 'AFC', 'West', 'Denver', 'CO', 'PatBowlen', 'VicFangio', 3),
    ('Baltimore Ravens', 'AFC', 'North', 'Baltimore', 'MD', 'SteveBisciotti', 'JohnHarbaugh', 2),
    ('Cleveland Browns', 'AFC', 'North', 'Cleveland', 'OH', 'JimmyHaslam', 'KevinStefanski', 0),
    ('Indianapolis Colts', 'AFC', 'South', 'Indianapolis', 'IN', 'JimIrsay', 'FrankReich', 2),
    ('Houston Texans', 'AFC', 'South', 'Houston', 'TX', 'CalMcNair', 'LovieSmith', 0),
    ('Jacksonville Jaguars', 'AFC', 'South', 'Jacksonville', 'FL', 'ShahidKhan', 'UrbanMeyer', 0),
    ('Tennessee Titans', 'AFC', 'South', 'Nashville', 'TN', 'AmyAdamsStrunk', 'MikeVrabel', 0),
    ('Arizona Cardinals', 'NFC', 'West', 'Glendale', 'AZ', 'MichaelBidwill', 'KliffKingsbury', 2),
    ('Los Angeles Rams', 'NFC', 'West', 'Los Angeles', 'CA', 'StanKroenke', 'SeanMcVay', 1),
    ('San Diego Chargers', 'AFC', 'West', 'Los Angeles', 'CA', 'DeanSpanos', 'BrandonStaley', 0),
    ('Las Vegas Raiders', 'AFC', 'West', 'Paradise', 'NV', 'MarkDavis', 'RichBisaccia', 3),
    ('Chicago Bears', 'NFC', 'North', 'Chicago', 'IL', 'VirginiaMcCaskey', 'MattNagy', 1),
    ('Detroit Lions', 'NFC', 'North', 'Detroit', 'MI', 'SheilaFordHamp', 'DanCampbell', 0),
    ('Green Bay Packers', 'NFC', 'North', 'Green Bay', 'WI', 'GreenBayPackersInc', 'MattLaFleur', 4),
    ('Minnesota Vikings', 'NFC', 'North', 'Minneapolis', 'MN', 'ZygiWilf', 'MikeZimmer', 0),
    ('Carolina Panthers', 'NFC', 'South', 'Charlotte', 'NC', 'DavidTepper', 'MattRhule', 0),
    ('New Orleans Saints', 'NFC', 'South', 'New Orleans', 'LA', 'GayleBenson', 'DennisAllen', 1),
    ('Tampa Bay Buccaneers', 'NFC', 'South', 'Tampa', 'FL', 'GlazerFamily', 'BruceArians', 2),
    ('Cincinnati Bengals', 'AFC', 'North', 'Cincinnati', 'OH', 'MikeBrown', 'ZacTaylor', 0),
    ('Houston Oilers', 'AFC', 'South', 'Houston', 'TX', 'BudAdams', 'JeffFisher', 0),
    ('Pittsburgh Steelers', 'AFC', 'North', 'Pittsburgh', 'PA', 'ArtRooney', 'MikeTomlin', 6);

INSERT INTO AFC_NORTH (TEAM_NAME, HEAD_COACH, CITY, STATE)
VALUES
	('Pittsburgh Steelers', 'MikeTomlin', 'Pittsburgh', 'PA'),
	('Baltimore Ravens', 'John Harbough', 'Baltimore', 'MD');
	
INSERT INTO AFC (TEAM_NAME, DIVISION)
VALUES
	('Pittsburgh Steelers', 'North'),
	('Cleveland Browns', 'North'),
	('Cincinnati Bengals', 'North'),
	('Baltimore Ravens', 'North');

INSERT INTO AFC (TEAM_NAME, DIVISION)
    SELECT TEAM_NAME, DIVISION FROM NFL_TEAMS
    WHERE CONFERENCE = 'AFC';

INSERT INTO AFC_EAST (TEAM_NAME, DIVISION)
    SELECT TEAM_NAME, DIVISION FROM NFL_TEAMS
    WHERE CONFERENCE = 'NFC';

DELETE FROM AFC
WHERE id NOT IN (
    SELECT MIN(TEAM_NAME)
    FROM AFC
    GROUP BY TEAM_NAME, DIVISION
);


CREATE TABLE AFC_SOUTH (
TEAM_NAME VARCHAR(50),
HEAD_COACH VARCHAR(30),
CITY VARCHAR(20),
"STATE" CHAR(2),
FOREIGN KEY (TEAM_NAME) REFERENCES NHL_TEAMS(TEAM_NAME)
);

CREATE TABLE AFC_EAST (
TEAM_NAME VARCHAR(50),
HEAD_COACH VARCHAR(30),
CITY VARCHAR(20),
"STATE" CHAR(2),
FOREIGN KEY (TEAM_NAME) REFERENCES NHL_TEAMS(TEAM_NAME)
);

CREATE TABLE AFC_WEST (
TEAM_NAME VARCHAR(50),
HEAD_COACH VARCHAR(30),
CITY VARCHAR(20),
"STATE" CHAR(2),
FOREIGN KEY (TEAM_NAME) REFERENCES NHL_TEAMS(TEAM_NAME)
);

INSERT INTO AFC_SOUTH (TEAM_NAME, HEAD_COACH, CITY,"STATE")
    SELECT TEAM_NAME, HEAD_COACH, CITY, "STATE" FROM NFL_TEAMS
    WHERE DIVISION = 'SOUTH';

INSERT INTO AFC_EAST (TEAM_NAME, HEAD_COACH, CITY,"STATE")
    SELECT TEAM_NAME, HEAD_COACH, CITY, "STATE" FROM NFL_TEAMS
    WHERE DIVISION = 'WEST';

INSERT INTO AFC_WEST (TEAM_NAME, HEAD_COACH, CITY,"STATE")
    SELECT TEAM_NAME, HEAD_COACH, CITY, "STATE" FROM NFL_TEAMS
    WHERE DIVISION = 'WEST';