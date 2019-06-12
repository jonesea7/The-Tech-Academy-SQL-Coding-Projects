 CREATE DATABASE jones_game_lib;

 --Welcome to my personal gaming library.
 --You will find several comments to indicate the challenges set forth by the assignment
 --I will use '--**' to denote a line of code is connected to a challenge to make it easier for you to identify what is required of me to complete the assignment
 --I've added more tables than required that are just for my enjoyment.

/* ======= CREATE A BRANCH/OWNER TABLE =======*/

CREATE TABLE OWNER_BRANCH (
	ownerID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	ownerName VARCHAR(30) NOT NULL, 
	ownerAddress VARCHAR(30) NOT NULL,
);

SELECT * FROM OWNER_BRANCH;

	
	--COLUMNS ownerID, ownerName, ownerAddress

	/* ======= INSERT OWNER VALUES ====== */

	--CHALLENGE: 4 owners
	--CHALLENGE: One owner/branch 'Phoenix' and one called "Edmund"

INSERT INTO OWNER_BRANCH
	(ownerName, ownerAddress)
	VALUES
	('Phoenix', '123 Sesame Street'), --**
	('Edmund', '777 Big Daddy Avenue'), --**
	('Palius', '666 Oh Brother Drive'), --**
	('Paris', '0 Microsoft Lane') --**
;
	
SELECT * FROM OWNER_BRANCH;

/* ======= CREATE A COPIES TABLE =======*/
--COLUMNS gameTitle fk to GAME(gameTitle) , ownerID fk to OWNER_BRANCH(ownerID), numCopies

		--NOTE-TO-SELF: if you alter a table after you have executed it, you will either have to DROP or ALTER the table in order for changes to take place
CREATE TABLE COPIES (
	gameTitle VARCHAR(50) NOT NULL,
	--gameTitle VARCHAR(30) NOT NULL CONSTRAINT fkCopiesGameTitle FOREIGN KEY REFERENCES GAME(gameTitle),
	ownerID INT NOT NULL CONSTRAINT fkCopiesOwnerID FOREIGN KEY REFERENCES OWNER_BRANCH(ownerID),
	numCopies INT NOT NULL,
);
	/* ======= INSERT VALUES FOR COPIES TABLE =======*/
	
	--CHALLENGE: "Kirby's Epic Yarn" in "Phoenix" Branch
	--CHALLENGE: each owner/branch has a least 10 GAME titles, and two copeis of each
	--CHALLENGE: two games developed by HIDEO KOJIMA in EDMUND owner/branch
INSERT INTO COPIES
	(gameTitle, ownerID, numCopies)
	VALUES
	('Kirbys Epic Yarn', 1, 2), --** OWNER:PHOENIX TITLE:1 COPIES: 2
	('Spider-Man:WOS', 1, 2), --** OWNER:PHOENIX TITLE:2 COPIES: 2
	('FlingSmash', 1, 2), --** OWNER:PHOENIX TITLE:3 COPIES: 2
	('Transformers:ROTF', 1, 2), --** OWNER:PHOENIX TITLE:4 COPIES: 2
	('Drawn To Life', 1, 2), --** OWNER:PHOENIX TITLE:5 COPIES: 2
	('Wii Sports Resort', 1, 2), --** OWNER:PHOENIX TITLE:6 COPIES: 2
	('All-Stars BR', 1, 2), --** OWNER:PHOENIX TITLE:7 COPIES: 2
	('Sonic Generations', 1, 2), --** OWNER:PHOENIX TITLE:8 COPIES: 2
	('Smash Brothers Ult', 1, 2), --** OWNER:PHOENIX TITLE:9 COPIES: 2
	('J-Stars Vic', 1, 2), --** OWNER:PHOENIX TITLE:10 COPIES: 2
	('Metal Gear Solid V', 2, 2), --** OWNER:EDMUND TITLE:1 COPIES: 2 DEVELOPER:HIDEO KOJIMA 1
	('Zone of the Enders', 2, 2), --** OWNER:EDMUND TITLE:2 COPIES: 2 DEV: HIDEO KOJIMA 2
	('RedSteel', 2, 2), --** OWNER:EDMUND TITLE:3 COPIES: 2
	('Wario Land', 2, 2), --** OWNER:EDMUND TITLE:4 COPIES: 2
	('WiiPlay', 2, 2), --** OWNER:EDMUND TITLE:5 COPIES: 2
	('Metroid: OM', 2, 2), --** OWNER:EDMUND TITLE:6 COPIES: 2
	('uDraw Studio', 2, 2), --** OWNER:EDMUND TITLE:7 COPIES: 2
	('Ghost Squad', 2, 2), --** OWNER:EDMUND TITLE:8 COPIES: 2
	('SNK Arc Clas V.1', 2, 2), --** OWNER:EDMUND TITLE:9 COPIES: 2
	('ESV: Skyrim', 2, 2), --** OWNER:EDMUND TITLE:10 COPIES: 2
	('Avatar: LA', 3, 2), --** OWNER:PALIUS TITLE:1 COPIES: 2
	('SpongeBob HeroPants', 3, 2), --** OWNER:PALIUS TITLE:2 COPIES: 2
	('Project Runway', 3, 2), --** OWNER:PALIUS TITLE:3 COPIES: 2
	('Wii Fit', 3, 2), --** OWNER:PALIUS TITLE:4 COPIES: 2
	('Rockband 3', 3, 13), --** OWNER:PALIUS TITLE:5 COPIES: 2
	('Mario Bros. Wii', 3, 200), --** OWNER:PALIUS TITLE:6 COPIES: 2
	('LEGO Dimensions', 3, 2), --** OWNER:PALIUS TITLE:7 COPIES: 2
	('Disney Infinity 2.0', 3, 2), --** OWNER:PALIUS TITLE:8 COPIES: 2
	('AMF Bowling', 3, 2), --** OWNER:PALIUS TITLE:9 COPIES: 2
	('LEGO Star Wars FA', 3, 2), --** OWNER:PALIUS TITLE:10 COPIES: 2
	('Divinity II', 4, 2), --** OWNER:PARIS TITLE:1 COPIES: 2
	('XCOM', 4, 2), --** OWNER:PARIS TITLE:2 COPIES: 2
	('Injustice II', 4, 2), --** OWNER:PARIS TITLE:3 COPIES: 2
	('Vampyr', 4, 2), --** OWNER:PARIS TITLE:4 COPIES: 2
	('Mortal Kombat 11', 4, 2), --** OWNER:PARIS TITLE:5 COPIES: 2
	('Dragonball Budokai 3', 4, 2), --** OWNER:PARIS TITLE:6 COPIES: 2
	('Naruto', 4, 2), --** OWNER:PARIS TITLE:7 COPIES: 2
	('Vampire: TM', 4, 2), --** OWNER:PARIS TITLE:8 COPIES: 2
	('Halo 3', 4, 2), --** OWNER:PARIS TITLE:9 COPIES: 2
	('Smite', 4, 2) --** OWNER:PARIS TITLE:10 COPIES: 2
;

SELECT * FROM COPIES;
/* ======= CREATE A LOANS TABLE =======*/
-- COLUMNS gameTitle fk to GAME(gameTitle), ownerID, borrowerID, dateOut, dateDue

	/* ======= INSERT VALUES FOR LOANS TABLE =======*/

	--CHALLENGE: 2 borrowers have more than 5 games loaned out
	--CHALLENGE: 50+ loans
	

/* ====== BORROWER TABLE ===== */
--COLUMNS borrowerID, borrowerName, borrowerAddress, borrowerPhone 

	/* ======= INSERT VALUES BORROWER ====== */

	--CHALLENGE: 8 borrowers
	

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
	gameID INT NOT NULL CONSTRAINT fkDevGameId FOREIGN KEY REFERENCES GAME(gameID)
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
	gameID INT PRIMARY KEY not null IDENTITY (1,1),
	gameTitle varchar(30) NOT NULL,
	gameMfr INT NOT NULL CONSTRAINT fkGameMfr FOREIGN KEY REFERENCES MANUFACTURER(mfrID),
	gameConsole INT NOT NULL CONSTRAINT fkGameConsole FOREIGN KEY REFERENCES CONSOLE(consoleID),
	gameGenre INT NOT NULL CONSTRAINT fkGameGenre FOREIGN KEY REFERENCES GENRE(genreID),
	gameEsrb INT NOT NULL CONSTRAINT fkGameEsrb FOREIGN KEY REFERENCES ESRB(esrbID),
	gameGIScore INT NOT NULL CONSTRAINT fkGameGIScore FOREIGN KEY REFERENCES GISCORE(giScoreID),
	gamePerScore INT NOT NULL CONSTRAINT fkGamePerScore FOREIGN KEY REFERENCES PERSONAL_SCORE(perScoreID),
	gamePub INT NOT NULL CONSTRAINT fkGamePub FOREIGN KEY REFERENCES PUBLISHER(pubID),
	gameDev INT NOT NULL CONSTRAINT fkGameDev FOREIGN KEY REFERENCES DEVELOPER(devID)
	
);

	/* ======= INSERT VALUES FOR GAMES TABLE ====== */

	--CHALLENGE: at least 20 Games in the GAME table.

/*======  ANOTHER FOREIGN KEYED TABLE LISTING MY FAVORITE GAMES WITH ONLY A FEW OF THE PARAMETERS THE SAME AS TABLES ABOVE ======*/










/*====== THIS IS THE TABLE THAT WILL HOLD THE FK MAPPING ======*/



CREATE TABLE tbl_favs (
	favs_id INT PRIMARY KEY not null IDENTITY (1,1),
);