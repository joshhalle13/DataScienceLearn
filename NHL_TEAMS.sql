NHL_TEAMS

CREATE TABLE NHL_TEAMS (
TEAM_NAME VARCHAR(50) NOT NULL,
CONFERENCE CHAR(20),
DIVISION VARCHAR(20),
CITY VARCHAR(20),
"STATE" CHAR(2),
"OWNER" VARCHAR(70),
HEAD_COACH VARCHAR(30),
STANLEY_CUP_WINS INT,
PRIMARY KEY(TEAM_NAME)
);

CREATE TABLE EASTERN (
TEAM_NAME VARCHAR(50),
DIVISION VARCHAR(20),
FOREIGN KEY (TEAM_NAME) REFERENCES NHL_TEAMS(TEAM_NAME)
);
	
CREATE TABLE WESTERN (
TEAM_NAME VARCHAR(50),
DIVISION VARCHAR(20),
FOREIGN KEY (TEAM_NAME) REFERENCES NHL_TEAMS(TEAM_NAME)
);

CREATE TABLE METROPOLITAN (
TEAM_NAME VARCHAR(50),
HEAD_COACH VARCHAR(30),
CITY VARCHAR(20),
"STATE" CHAR(2),
FOREIGN KEY (TEAM_NAME) REFERENCES NHL_TEAMS(TEAM_NAME)
);

INSERT INTO NHL_TEAMS (TEAM_NAME, CONFERENCE, DIVISION, CITY, "STATE", "OWNER", HEAD_COACH, STANLEY_CUP_WINS)
VALUES
	('Anaheim Ducks', 'Western', 'Pacific', 'Anaheim', 'CA', 'Henry and Susan Samueli', 'Dallas Eakins', 1),
	('Arizona Coyotes', 'Western', 'Pacific', 'Glendale', 'AZ', 'Alex Meruelo', 'André Tourigny', 0),
	('Boston Bruins', 'Eastern', 'Atlantic', 'Boston', 'MA', 'Jeremy Jacobs', 'Bruce Cassidy', 6),
	('Buffalo Sabres', 'Eastern', 'Atlantic', 'Buffalo', 'NY', 'Terry Pegula', 'Don Granato', 0),
	('Calgary Flames', 'Western', 'Pacific', 'Calgary', 'AB', 'Calgary Sports and Entertainment Corporation', 'Darryl Sutter', 1),
	('Carolina Hurricanes', 'Eastern', 'Metropolitan', 'Raleigh', 'NC', 'Tom Dundon', 'Rod Brind''Amour', 1),
	('Chicago Blackhawks', 'Western', 'Central', 'Chicago', 'IL', 'Rocky Wirtz', 'Derek King', 6),
	('Colorado Avalanche', 'Western', 'Central', 'Denver', 'CO', 'Ann Walton Kroenke', 'Jared Bednar', 2),
	('Columbus Blue Jackets', 'Eastern', 'Metropolitan', 'Columbus', 'OH', 'John P. McConnell', 'Brad Larsen', 0),
	('Dallas Stars', 'Western', 'Central', 'Dallas', 'TX', 'Tom Gaglardi', 'Rick Bowness', 1),
	('Detroit Red Wings', 'Eastern', 'Atlantic', 'Detroit', 'MI', 'Ilitch Holdings', 'Jeff Blashill', 11),
	('Edmonton Oilers', 'Western', 'Pacific', 'Edmonton', 'AB', 'Daryl Katz', 'Jay Woodcroft', 5),
	('Florida Panthers', 'Eastern', 'Atlantic', 'Sunrise', 'FL', 'Vinnie Viola', 'Andrew Brunette', 0),
	('Los Angeles Kings', 'Western', 'Pacific', 'Los Angeles', 'CA', 'Philip Anschutz', 'Todd McLellan', 2),
	('Minnesota Wild', 'Western', 'Central', 'Saint Paul', 'MN', 'Craig Leipold', 'Dean Evason', 0),
	('Montreal Canadiens', 'Eastern', 'Atlantic', 'Montreal', 'QC', 'Geoff Molson', 'Dominique Ducharme', 24),
	('Nashville Predators', 'Western', 'Central', 'Nashville', 'TN', 'Predators Holdings LLC', 'John Hynes', 0),
	('New Jersey Devils', 'Eastern', 'Metropolitan', 'Newark', 'NJ', 'Harris Blitzer Sports & Entertainment', 'Lindy Ruff', 3),
	('New York Islanders', 'Eastern', 'Metropolitan', 'Uniondale', 'NY', 'Jon Ledecky & Scott D. Malkin', 'Barry Trotz', 4),
	('New York Rangers', 'Eastern', 'Metropolitan', 'New York City', 'NY', 'Madison Square Garden Sports', 'Gerard Gallant', 4),
	('Ottawa Senators', 'Eastern', 'Atlantic', 'Ottawa', 'ON', 'Eugene Melnyk', 'D.J. Smith', 0),
	('Philadelphia Flyers', 'Eastern', 'Metropolitan', 'Philadelphia', 'PA', 'Comcast Spectacor', 'Mike Yeo', 2),
	('Pittsburgh Penguins', 'Eastern', 'Metropolitan', 'Pittsburgh', 'PA', 'Ronald Burkle & Mario Lemieux', 'Mike Sullivan', 5),
	('San Jose Sharks', 'Western', 'Pacific', 'San Jose', 'CA', 'Hasso Plattner', 'Bob Boughner', 0),
	('Seattle Kraken', 'Western', 'Pacific', 'Seattle', 'WA', 'Seattle Hockey Partners', 'Dave Hakstol', 0),
	('St. Louis Blues', 'Western', 'Central', 'St. Louis', 'MO', 'Tom Stillman', 'Craig Berube', 1),
	('Tampa Bay Lightning', 'Eastern', 'Atlantic', 'Tampa', 'FL', 'Jeff Vinik', 'Jon Cooper', 2),
	('Toronto Maple Leafs', 'Eastern', 'Atlantic', 'Toronto', 'ON', 'Maple Leaf Sports & Entertainment', 'Sheldon Keefe', 13),
	('Vancouver Canucks', 'Western', 'Pacific', 'Vancouver', 'BC', 'Francesco Aquilini', 'Travis Green', 0),
	('Vegas Golden Knights', 'Western', 'Pacific', 'Paradise', 'NV', 'Bill Foley', 'Pete DeBoer', 0),
	('Washington Capitals', 'Eastern', 'Metropolitan', 'Washington, D.C.', 'DC', 'Monumental Sports & Entertainment', 'Peter Laviolette', 1),
	('Winnipeg Jets', 'Western', 'Central', 'Winnipeg', 'MB', 'True North Sports & Entertainment', 'Dave Lowry', 0);

INSERT INTO EASTERN (TEAM_NAME, DIVISION)
	SELECT (TEAM_NAME, DIVISION) FROM NHL_TEAMS
	WHERE CONFERENCE = 'Eastern';

INSERT INTO METROPOLITAN (TEAM_NAME, HEAD_COACH, CITY,"STATE")
	SELECT TEAM_NAME, HEAD_COACH, CITY, "STATE" FROM NHL_TEAMS
	WHERE DIVISION = 'Metropolitan';
	SELECT * FROM METROPOLITAN

CREATE TABLE ATLANTIC (
TEAM_NAME VARCHAR(50),
HEAD_COACH VARCHAR(30),
CITY VARCHAR(20),
"STATE" CHAR(2),
FOREIGN KEY (TEAM_NAME) REFERENCES NHL_TEAMS(TEAM_NAME)
);

CREATE TABLE CENTRAL (
TEAM_NAME VARCHAR(50),
HEAD_COACH VARCHAR(30),
CITY VARCHAR(20),
"STATE" CHAR(2),
FOREIGN KEY (TEAM_NAME) REFERENCES NHL_TEAMS(TEAM_NAME)
);

CREATE TABLE PACIFIC (
TEAM_NAME VARCHAR(50),
HEAD_COACH VARCHAR(30),
CITY VARCHAR(20),
"STATE" CHAR(2),
FOREIGN KEY (TEAM_NAME) REFERENCES NHL_TEAMS(TEAM_NAME)
);

INSERT INTO ATLANTIC (TEAM_NAME, HEAD_COACH, CITY,"STATE")
	SELECT TEAM_NAME, HEAD_COACH, CITY, "STATE" FROM NHL_TEAMS
	WHERE DIVISION = 'Atlantic';

INSERT INTO CENTRAL (TEAM_NAME, HEAD_COACH, CITY,"STATE")
	SELECT TEAM_NAME, HEAD_COACH, CITY, "STATE" FROM NHL_TEAMS
	WHERE DIVISION = 'Central';

INSERT INTO PACIFIC (TEAM_NAME, HEAD_COACH, CITY,"STATE")
	SELECT TEAM_NAME, HEAD_COACH, CITY, "STATE" FROM NHL_TEAMS
	WHERE DIVISION = 'Pacific';