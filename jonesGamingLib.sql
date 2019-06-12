 CREATE DATABASE jones_game_lib;

/*======  CREATE MANUFACTURER TABLE ID(100)======*/

CREATE TABLE MANUFACTURER (
	mfrID INT PRIMARY KEY not null IDENTITY (100,1),
	mfrName VARCHAR(30) NOT NULL
);

INSERT INTO MANUFACTURER
	(mfrName)
	VALUES
	('Nintendo'),
	('Microsoft'),
	('Sony'),
	('Sega')
;

/*======  CREATE CONSOLE TABLE ID(200)======*/

CREATE TABLE CONSOLE(
	consoleID INT PRIMARY KEY NOT NULL IDENTITY (200,1),
	consoleMfr INT CONSTRAINT fk_console_mfr FOREIGN KEY REFERENCES MANUFACTURER(mfrName) ON UPDATE CASCADE ON DELETE CASCADE,
	consoleName VARCHAR(20) NOT NULL
);
	/*======  INSERT SYSTEMS OVER THE YEARS AS VALUES ======*/

INSERT INTO CONSOLE
	(consoleMfr, consoleName)
	VALUES
	(100, 'NES'),
	(100, 'SNES'),
	(100, 'N64'),
	(100, 'GC'),
	(100, 'Wii'),
	(100, 'WiiU'),
	(100, 'Switch'),
	(101, 'xb'),
	(101, 'xb360'),
	(101, 'xb1'),
	(102, 'psx'),
	(102, 'ps2'),
	(102, 'ps3'),
	(102, 'ps4'),
	(102, 'psp'),
	(102, 'psvita'),
	(102, 'psvr'),
	(103, 'genesis'),
	(103, 'cd'),
	(103, 'saturn'),
	(103, 'dreamcast')
;

SELECT * FROM tbl_console;

/*======  CREATE GENRE TABLE ID (200) ======*/

CREATE TABLE GENRE (
	genreID INT PRIMARY KEY not null IDENTITY (200,1),
	genreType VARCHAR(15) NOT NULL
);

/*======  VALUES: ABBREVIATED WORDS OF THE GENRES (6 letters or less?) ======*/
INSERT INTO GENRE
	(genreType)
	VALUES
	('FPS'),
	('SRPG'),
	('JRPG'),
	('WRPG'),
	('SPRT'),
	('FGHT'),
	('COOP'),
	('PLTFRM'),
	('OLDSKL'),
	('RACE')
;

/*======  CREATE ESRB RATING TABLE ID(300) ======*/

CREATE TABLE ESRB (
	esrbID INT PRIMARY KEY NOT NULL IDENTITY (300,10),
	esrbRating VARCHAR(5) NOT NULL
);

	/*======  VALUES: eC E E+10 T M Ao ======*/

INSERT INTO ESRB
	(esrbRating)
	VALUES
	('eC'),
	('E'),
	('E+10'),
	('T'),
	('M'),
	('Ao')
;

/*======  CREATE GAME INFORMER SCORE TABLE ID(400) ======*/

CREATE TABLE GISCORE (
	giScoreID INT PRIMARY KEY NOT NULL IDENTITY (400,1),
	giGameScore VARCHAR(10) NOT NULL
);

	/*======  VALUES: 1/10 - 10/10 ======*/

INSERT INTO GISCORE
	(giGameScore)
	VALUES
	('1/10'),
	('2/10'),
	('3/10'),
	('4/10'),
	('5/10'),
	('6/10'),
	('7/10'),
	('8/10'),
	('9/10'),
	('10/10')
;

/*======  CREATE FAMILY SCORE TABLE ID(500) 10/10 SCALE ======*/

CREATE TABLE PERSONAL_SCORE(
	perScoreID INT PRIMARY KEY NOT NULL IDENTITY (500,1),
	perScore VARCHAR(10) NOT NULL
);

	/*======  VALUES: 1/10 - 10/10 ======*/

INSERT INTO PERSONAL_SCORE
	(perScore)
	VALUES
	('1/10'),
	('2/10'),
	('3/10'),
	('4/10'),
	('5/10'),
	('6/10'),
	('7/10'),
	('8/10'),
	('9/10'),
	('10/10')
;


/*======  CREATE PUBLISHER TABLE ID(600) ======*/
CREATE TABLE PUBLISHER (
	pubID INT PRIMARY KEY NOT NULL IDENTITY(600,1),
	pubName VARCHAR(30) NOT NULL,
	pubCountryOrigin VARCHAR(30) NOT NULL,

);

	/*======  VALUES: SONY, SEGA, ATLUS, ETC. ======*/

INSERT INTO PUBLISHER
	(pubName)
	VALUES
	('Sega'),
	('Atlus'),
	('Nintendo'),
	('Microsoft'),
	('Sony')
;

/*======  CREATE DEVELOPER TABLE ID(700) ======*/
CREATE TABLE DEVELOPER (
	devID INT PRIMARY KEY NOT NULL IDENTITY(700,1),
	devName VARCHAR(30) NOT NULL,
);

	/*======  VALUES: i.e. INSOMNIAC, NINTENDO, NAUGHTY DOG, ETC. ======*/

	--ASSIGNMENT CHALLENGE: 'At least 10 developers in DEVELOPER table

INSERT INTO DEVELOPER
	(devName)
	VALUES
	('Insomniac'), --1
	('Nintendo'), --2, 2 developers
	('Naughty Dog'), --3
	('Activision'), --4
	('Ubisoft'), --5
	('THQ'), --6
	('MTV Games'), --7
	('Atari'), --8
	('Sega'), --9
	('SNK'), --10, 10 Developers, Ah, Ah Ah...
	('D3')
;

/*======  FOREIGN KEYED TABLE WITH ALL THE TABLES LINKED ABOVE ======*/

CREATE TABLE GAME (
	titleID INT PRIMARY KEY not null IDENTITY (1,1),
	titleGame varchar(50) NOT NULL,
	gameMfr INT NOT NULL CONSTRAINT fkGameMfr FOREIGN KEY REFERENCES MANUFACTURER(mfrID),
	gameConsole INT NOT NULL CONSTRAINT fkGameConsole FOREIGN KEY REFERENCES CONSOLE(consoleID),
	gameGenre INT NOT NULL CONSTRAINT fkGameGenre FOREIGN KEY REFERENCES GENRE(genreID),
	gameEsrb INT NOT NULL CONSTRAINT fkGameEsrb FOREIGN KEY REFERENCES ESRB(esrbID),
	gameGIScore INT NOT NULL CONSTRAINT fkGameGIScore FOREIGN KEY REFERENCES GISCORE(giScoreID),
	gamePerScore INT NOT NULL CONSTRAINT fkGamePerScore FOREIGN KEY REFERENCES PERSONAL_SCORE(perScoreID),
	gamePub INT NOT NULL CONSTRAINT fkGamePub FOREIGN KEY REFERENCES PUBLISHER(pubID),
	gameDev INT NOT NULL CONSTRAINT fkGameDev FOREIGN KEY REFERENCES DEVELOPER(devID)
	
);

/*======  ANOTHER FOREIGN KEYED TABLE LISTING MY FAVORITE GAMES WITH ONLY A FEW OF THE PARAMETERS THE SAME AS TABLES ABOVE ======*/










/*====== THIS IS THE TABLE THAT WILL HOLD THE FK MAPPING ======*/



CREATE TABLE tbl_favs (
	favs_id INT PRIMARY KEY not null IDENTITY (1,1),
);