CREATE DATABASE dbLibrary
 
 --Welcome to my personal gaming library.
 --You will find several comments to indicate the challenges set forth by the assignment
 --I will use '--**' to denote a line of code is connected to a challenge to make it easier for you to identify what is required of me to complete the assignment
 --I've added more tables than required that are just for my enjoyment.

/* ======= CREATE A BRANCH/OWNER TABLE =======*/
USE dbLibrary;

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

/* ====== BORROWER TABLE ===== */
--COLUMNS borrowerID, borrowerName, borrowerAddress, borrowerPhone

CREATE TABLE BORROWER (
	borrowerID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	borrowerName VARCHAR(30) NOT NULL,
	borrowerAddress VARCHAR(30) NOT NULL,
	borrowerPhone VARCHAR(30) NOT NULL
);

SELECT * FROM BORROWER;
	/* ======= INSERT VALUES BORROWER ====== */

	--CHALLENGE: 8 borrowers

INSERT INTO BORROWER
	(borrowerName, borrowerAddress, borrowerPhone)
	VALUES
	('Emmanuel Kant','2 Fear','313-555-1222'),
	('Robert Kiyosaki','22 Magic','313-555-1333'),
	('Tim Ferriss','223 Kingdom Hall','313-555-1444'),
	('Eckhart Tolle','1 Now','313-555-1555'),
	('Robert Greene','48 Power Lane','313-555-1666'),
	('Zed A. Shaw','13 Hard Way','313-555-1777'),
	('Haruki Murakami','0 Unknown Blvd.','313-555-1888'),
	('Ayn Rand','1000 Fountainhead Dr.','313-555-1999'),
	('George Clauson','1 Rich Ave.','313-555-2111'),
	('H. Kojima','13 Weirdville','313-555-2222'),
	('Aaron Burr','1 Shot','313-555-2333'),
	('Larry G. Bowman Jr.','02 Big Poppa Way','313-555-2444'),
	('Alleccia Bowman','888 New Way','313-555-2755'),
	('Freddie Mercury','712 Bohemia Ave.','313-555-2666'),
	('Guy Sandvilles','434 Powder Springs','313-555-2777'),
	('Miles Fowler','7 Green Hills Zone','313-555-2888'),
	('Epicurus Jones','1 Greek Court','313-555-2999'),
	('Aristotle Jackson','1 Greek Circuit','313-555-3111'),
	('Epictetus Smith','1 Greek Path','313-555-3222'),
	('Creflo Dollar','7 Lucky Way','313-555-3333'),
	('Sean Carter','909 Queens Blvd.','313-555-3444'),
	('Davis Love','6 On Par Dr.','313-555-3555'),
	('Phineas Wunder','34 Great Vacation','313-555-3666'),
	('Pedro Cemen','12941 Syracuse','313-839-9205'),
	('Serena Williams','700 Winning Way','313-555-3888'),
	('Thomas Brady','6 Rings Drive','313-555-3999')
;

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
	consoleMfr INT CONSTRAINT fkConsoleMfr FOREIGN KEY REFERENCES MANUFACTURER(mfrID) ON UPDATE CASCADE ON DELETE CASCADE,
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

/*======  CREATE GENRE TABLE ID (300) ======*/

CREATE TABLE GENRE (
	genreID INT PRIMARY KEY not null IDENTITY (300,1),
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
	('RACE'),
	('ACTN'),
	('SHTR'),
	('OTHR')
;

SELECT * FROM GENRE;
/*======  CREATE ESRB RATING TABLE ID(400) ======*/

CREATE TABLE ESRB (
	esrbID INT PRIMARY KEY NOT NULL IDENTITY (400,10),
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

/*======  CREATE PUBLISHER TABLE ID(500) ======*/

CREATE TABLE PUBLISHER (
	pubID INT PRIMARY KEY NOT NULL IDENTITY(500,1),
	pubName VARCHAR(30) NOT NULL,
	pubCountryOrigin VARCHAR(30) NOT NULL,

);


	/*======  VALUES: SONY, SEGA, ATLUS, ETC. ======*/

INSERT INTO PUBLISHER
	(pubName, pubCountryOrigin)
	VALUES
	('Sega', 'Japan'),
	('Atlus', 'Japan'),
	('Nintendo', 'Japan'),
	('Microsoft', 'USA'),
	('Sony', 'Japan'),
	('Activision', 'USA'),
	('THQ', 'USA'),
	('Bandai Namco', 'Japan'),
	('Konami', 'Japan'),
	('SNK', 'Japan'),
	('Bethesda', 'USA'),
	('Atari', 'USA'),
	('MTV', 'USA'),
	('WB', 'USA'),
	('Disney', 'USA')
	
;


/*======  CREATE DEVELOPER TABLE ID(600) ======*/
CREATE TABLE DEVELOPER (
	devID INT PRIMARY KEY NOT NULL IDENTITY(600,1),
	devName VARCHAR(30) NOT NULL
	
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
	('D3'),
	('Hideo Kojima'),
	('Shaba'),
	('Luxoflux'),
	('SuperBot'),
	('Bandai Namco'),
	('Spike Chunsoft'),
	('Good-Feel'),
	('Team Ninja'),
	('Pipeworks'),
	('Bethesda'),
	('Behaviour'),
	('Tornado'),
	('Harmonix'),
	('TravellersTales'),
	('Avalanche')
;

/*======  CREATE GAME INFORMER SCORE TABLE ID(1,1) ======*/

CREATE TABLE GISCORE (
	giScoreID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	giGameScore VARCHAR(10) NOT NULL
);

	/*======  VALUES: 1/10 - 10/10 ======*/

INSERT INTO GISCORE
	(giGameScore)
	VALUES
	('N/A'),
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

/*======  CREATE FAMILY SCORE TABLE ID(1,1) 10/10 SCALE ======*/

CREATE TABLE PERSONAL_SCORE(
	perScoreID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
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


CREATE TABLE GAME (
	gameID INT  not null PRIMARY KEY IDENTITY (1,1),
	gameTitle VARCHAR(30) NOT NULL,
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
	
INSERT INTO GAME
	(gameTitle, gameMfr,
	gameConsole,gameGenre,
	gameEsrb,gameGIScore,
	gamePerScore,
	gamePub,gameDev)
	VALUES
	('Kirby''s Epic Yarn', 100, 204, 307, 410, 9, 9, 502, 601),
	('Spider-Man:WOS', 100, 204, 308, 430, 6, 7, 505, 612),
	('FlingSmash', 100, 204, 307, 410, 7, 7, 502, 601), 
	('Transformers:ROTF', 100, 204, 309, 430, 5, 1, 505, 613),
	('Drawn To Life', 100, 204, 307, 410, 6, 5, 506, 605),
	('Wii Sports Resort', 100, 204, 304, 410, 7, 10, 502, 601), --100, 502, 601 is Nintendo
	('All-Stars BR', 102, 212, 305, 430, 7, 8, 504, 614),
	('Sonic Generations', 102, 212, 307, 410, 6, 10, 500, 608),
	( 'Smash Bros. Ult.', 100, 206, 305, 420, 9, 10, 502, 615),
	('J-Stars Vic', 102, 212, 305, 430, 1, 7, 507, 616),
	('Metal Gear Solid V', 102, 212, 308, 440, 9, 7, 508, 611),
	('Zone of the Enders', 101, 208, 308, 430, 1, 7, 508, 611),
	( 'RedSteel', 100, 204, 300, 440, 7, 6, 509, 604),
	('Wario Land', 100, 204, 307, 410, 7, 7, 502, 617),
	('WiiPlay', 100, 204, 304, 410, 5, 5, 502, 601),
	('Metroid: OM', 100, 204, 309, 430, 6, 7, 502, 618),
	('uDraw Studio', 100, 204, 311, 410, 6, 6, 506, 619),
	('Ghost Squad', 100, 204, 300,430, 7, 8, 500, 608),
	('SNK Arc Clas V.1', 100, 204, 308, 430, 6, 7, 510, 609),
	('ESV: Skyrim', 102, 212, 303, 440, 9, 10, 511, 620),
	('Avatar: LA', 100, 203, 309, 420, 5, 5, 506, 605),
	('SpongeBob HeroPants', 101, 208, 309, 410, 5, 4, 505, 621),
	('Project Runway', 100, 204, 311, 410, 1, 3, 512, 622),
	('Wii Fit', 100, 204, 311, 410, 7, 7, 502, 601),
	('Rockband 3', 100, 204, 311, 430, 9, 9, 513, 623),
	('Mario Bros. Wii', 100, 204, 307, 410, 9, 7, 502, 601),
	('LEGO Dimensions', 102, 213, 309, 410, 9, 8, 514, 624),
	('Disney Infinity 2.0', 101, 208, 309, 410, 8, 7, 514, 625),
	('AMF Bowling', 101, 208, 309, 410, 8, 7, 514, 625), --left off here
	('LEGO Star Wars FA', 101, 208, 309, 410, 8, 7, 514, 625),
	('Divinity II', 101, 208, 309, 410, 8, 7, 514, 625),
	('XCOM', 101, 208, 309, 410, 8, 7, 514, 625),
	('Injustice II', 101, 208, 309, 410, 8, 7, 514, 625),
	('Vampyr', 101, 208, 309, 410, 8, 7, 514, 625),
	('Mortal Kombat 11', 101, 208, 309, 410, 8, 7, 514, 625),
	('Dragonball Budokai 3', 101, 208, 309, 410, 8, 7, 514, 625),
	('Naruto', 101, 208, 309, 410, 8, 7, 514, 625),
	('Vampire: TM', 101, 208, 309, 410, 8, 7, 514, 625),
	('Halo 3', 101, 208, 309, 410, 8, 7, 514, 625),
	('Smite', 101, 208, 309, 410, 8, 7, 514, 625)
;

/* ======= CREATE A COPIES TABLE =======*/
--COLUMNS gameTitle fk to GAME(gameTitle) , ownerID fk to OWNER_BRANCH(ownerID), numCopies

		--NOTE-TO-SELF: if you alter a table after you have executed it, you will either have to DROP or ALTER the table in order for changes to take place


CREATE TABLE COPIES (
	gameID INT NOT NULL CONSTRAINT fkCopiesGameID FOREIGN KEY REFERENCES GAME(gameID) ON UPDATE CASCADE ON DELETE CASCADE,
	gameTitle VARCHAR(30) NOT NULL,
	ownerID INT NOT NULL CONSTRAINT fkCopiesOwnerID FOREIGN KEY REFERENCES OWNER_BRANCH(ownerID) ON UPDATE CASCADE ON DELETE CASCADE,
	numCopies INT NOT NULL,
);
	/* ======= INSERT VALUES FOR COPIES TABLE =======*/
	
	--CHALLENGE: "Kirby's Epic Yarn" in "Phoenix" Branch
	--CHALLENGE: each owner/branch has a least 10 GAME titles, and two copeis of each
	--CHALLENGE: two games developed by HIDEO KOJIMA in EDMUND owner/branch
	select * from loans
INSERT INTO COPIES
	(gameTitle, gameID, ownerID, numCopies)
	VALUES
	('Kirby''s Epic Yarn', 1, 1, 2), --** OWNER:PHOENIX TITLE:1 COPIES: 2
	('Spider-Man:WOS',2, 1, 200), --** OWNER:PHOENIX TITLE:2 COPIES: 2
	('FlingSmash',3, 1, 2), --** OWNER:PHOENIX TITLE:3 COPIES: 2
	('Transformers:ROTF', 4, 1, 2), --** OWNER:PHOENIX TITLE:4 COPIES: 2
	('Drawn To Life', 5, 1, 2), --** OWNER:PHOENIX TITLE:5 COPIES: 2
	('Wii Sports Resort', 6, 1, 200), --** OWNER:PHOENIX TITLE:6 COPIES: 2
	('All-Stars BR', 7, 1, 2), --** OWNER:PHOENIX TITLE:7 COPIES: 2
	('Sonic Generations', 8, 1, 200), --** OWNER:PHOENIX TITLE:8 COPIES: 2
	( 'Smash Bros. Ult.', 9, 1, 200), --** OWNER:PHOENIX TITLE:9 COPIES: 2
	('J-Stars Vic', 10, 1, 2), --** OWNER:PHOENIX TITLE:10 COPIES: 2
	('Metal Gear Solid V', 11, 2, 200), --** OWNER:EDMUND TITLE:1 COPIES: 2 DEVELOPER:HIDEO KOJIMA 1
	('Zone of the Enders', 12, 2, 2), --** OWNER:EDMUND TITLE:2 COPIES: 2 DEV: HIDEO KOJIMA 2
	('RedSteel', 13, 2, 2), --** OWNER:EDMUND TITLE:3 COPIES: 2
	('Wario Land', 14, 2, 2), --** OWNER:EDMUND TITLE:4 COPIES: 2
	('WiiPlay', 15, 2, 2), --** OWNER:EDMUND TITLE:5 COPIES: 2
	('Metroid: OM', 16, 2, 2), --** OWNER:EDMUND TITLE:6 COPIES: 2
	('uDraw Studio', 17, 2, 2), --** OWNER:EDMUND TITLE:7 COPIES: 2
	('Ghost Squad', 18, 2, 2), --** OWNER:EDMUND TITLE:8 COPIES: 2
	('SNK Arc Clas V.1', 19, 2, 2), --** OWNER:EDMUND TITLE:9 COPIES: 2
	('ESV: Skyrim', 20, 2, 200), --** OWNER:EDMUND TITLE:10 COPIES: 2
	('Avatar: LA', 21, 3, 2), --** OWNER:PALIUS TITLE:1 COPIES: 2
	('SpongeBob HeroPants', 22, 3, 200), --** OWNER:PALIUS TITLE:2 COPIES: 2
	('Project Runway', 23, 3, 2), --** OWNER:PALIUS TITLE:3 COPIES: 2
	('Wii Fit', 24, 3, 2), --** OWNER:PALIUS TITLE:4 COPIES: 2
	('Rockband 3', 25, 3, 13), --** OWNER:PALIUS TITLE:5 COPIES: 2
	('Mario Bros. Wii', 26, 3, 200), --** OWNER:PALIUS TITLE:6 COPIES: 2
	('LEGO Dimensions', 27, 3, 2), --** OWNER:PALIUS TITLE:7 COPIES: 2
	('Disney Infinity 2.0', 28, 3, 2), --** OWNER:PALIUS TITLE:8 COPIES: 2
	('AMF Bowling', 29, 3, 200), --** OWNER:PALIUS TITLE:9 COPIES: 2
	('LEGO Star Wars FA', 30, 3, 2), --** OWNER:PALIUS TITLE:10 COPIES: 2
	('Divinity II', 31, 4, 2), --** OWNER:PARIS TITLE:1 COPIES: 2
	('XCOM', 32, 4, 2), --** OWNER:PARIS TITLE:2 COPIES: 2
	('Injustice II', 33, 4, 200), --** OWNER:PARIS TITLE:3 COPIES: 2
	('Vampyr', 34, 4, 2), --** OWNER:PARIS TITLE:4 COPIES: 2
	('Mortal Kombat 11', 35, 4, 200), --** OWNER:PARIS TITLE:5 COPIES: 2
	('Dragonball Budokai 3', 36, 4, 2), --** OWNER:PARIS TITLE:6 COPIES: 2
	('Naruto', 37, 4, 2), --** OWNER:PARIS TITLE:7 COPIES: 2
	('Vampire: TM', 38, 4, 2), --** OWNER:PARIS TITLE:8 COPIES: 2
	('Halo 3', 39, 4, 200), --** OWNER:PARIS TITLE:9 COPIES: 2
	('Smite', 40, 4, 2) --** OWNER:PARIS TITLE:10 COPIES: 2
;

/* ======= CREATE A LOANS TABLE =======*/

	-- COLUMNS gameTitle fk to GAME(gameTitle), ownerID, borrowerID, dateOut, dateDue
	
CREATE TABLE LOANS (
	gameID INT NOT NULL CONSTRAINT fkLoansGameID FOREIGN KEY REFERENCES GAME(gameID) ON UPDATE CASCADE ON DELETE CASCADE,
	gameTitle VARCHAR(30) NOT NULL,
	ownerID INT NOT NULL CONSTRAINT fkLoansOwnerID FOREIGN KEY REFERENCES OWNER_BRANCH(ownerID),
	borrowerID INT NOT NULL CONSTRAINT fkLoansBorrowerID FOREIGN KEY REFERENCES BORROWER(borrowerID),
	dateOut DATE NOT NULL,
	dateDue DATE NOT NULL
);

SELECT * FROM LOANS;

	/* ======= INSERT VALUES FOR LOANS TABLE =======*/
	
	--CHALLENGE: 2 borrowers have more than 5 games loaned out
	--CHALLENGE: 50+ loans


INSERT INTO LOANS
	(gameID, gameTitle, ownerID, borrowerID, dateOut, dateDue)
	VALUES
	(35, 'Mortal Kombat 11', 4, 7,  '2019-06-11', '2019-07-01'), --** 1st BORROWER #7: 1/5  games borrowered
	(32, 'XCOM', 4, 7,  '2019-06-11', '2019-07-01'), --** BORROWER #7: 2/5  games borrowered
	(31, 'Divinity II', 4, 7,  '2019-06-11', '2019-07-01'), --** BORROWER #7: 3/5  games borrowered
	(33, 'Injustice II', 4, 7,  '2019-06-11', '2019-07-01'), --** BORROWER #7: 4/5  games borrowered
	(1, 'Kirby''s Epic Yarn', 1, 7,  '2019-06-11', '2019-07-01'), --** BORROWER #4: 5/5  games borrowered
	(8, 'Sonic Generations', 1, 4,  '2019-06-06', '2019-06-26'), --** 2nd BORROWER #4: 1/5  games borrowered
	(9, 'Smash Bros. Ult.', 1, 4,  '2019-06-06', '2019-06-26'), --** BORROWER #4: 2/5  games borrowered
	(3, 'FlingSmash', 1, 4,  '2019-06-06', '2019-06-26'), --** BORROWER #4: 3/5  games borrowered
	(4, 'Transformers:ROTF', 1, 4,  '2019-06-06', '2019-06-26'), --** BORROWER #4: 4/5  games borrowered
	(1, 'Kirby''s Epic Yarn', 1, 2,  '2019-06-05', '2019-06-25'), --** BORROWER #4: 5/5  games borrowered
	(2 ,'Spider-Man:WOS', 1, 2,  '2019-06-05', '2019-06-25'),
	(9, 'Smash Bros. Ult.', 1, 2,  '2019-06-05', '2019-06-25'),
	(2, 'Spider-Man:WOS', 1, 3,  '2019-06-05', '2019-06-25'),
	(2, 'Spider-Man:WOS', 1, 3,  '2019-06-05', '2019-06-25'),
	(9, 'Smash Bros. Ult.', 1, 3,  '2019-06-05', '2019-06-25'),
	(2, 'Spider-Man:WOS', 1, 6,  '2019-06-05', '2019-06-25'),
	(2, 'Spider-Man:WOS', 1, 6,  '2019-06-05', '2019-06-25'),
	(9, 'Smash Bros. Ult.', 1, 6,  '2019-06-05', '2019-06-25'),
	(20, 'ESV: Skyrim', 2, 6,  '2019-06-05', '2019-06-25'),
	(13, 'RedSteel', 2, 9,  '2019-06-04', '2019-06-24'),
	(20, 'ESV: Skyrim', 2, 9,  '2019-06-04', '2019-06-24'),
	(12, 'Zone of the Enders', 2, 10,  '2019-06-04', '2019-06-24'),
	(20, 'ESV: Skyrim', 2, 10,  '2019-06-04', '2019-06-24'),
	(14, 'Wario Land', 2, 14,  '2019-06-04', '2019-06-24'),
	(15, 'WiiPlay', 2, 14,  '2019-06-04', '2019-06-24'),
	(20, 'ESV: Skyrim', 2, 14,  '2019-06-04', '2019-06-24'),
	(14, 'Wario Land', 2, 11,  '2019-06-04', '2019-06-24'),
	(16, 'Metroid: OM', 2, 11,  '2019-06-04', '2019-06-24'),
	(20, 'ESV: Skyrim', 2, 11,  '2019-06-04', '2019-06-24'),
	(20, 'ESV: Skyrim', 2, 12,  '2019-06-04', '2019-06-24'),
	(23, 'Project Runway', 3, 13,  '2019-06-04', '2019-06-24'),
	(24, 'Wii Fit', 3, 13,  '2019-06-04', '2019-06-24'),
	(22, 'SpongeBob HeroPants', 3, 13,  '2019-06-04', '2019-06-24'),
	(25, 'Rockband 3', 3, 15,  '2019-06-04', '2019-06-24'),
	(22, 'SpongeBob HeroPants', 3, 15,  '2019-06-04', '2019-06-24'),
	(29, 'AMF Bowling', 3, 16,  '2019-06-04', '2019-06-24'),
	(22, 'SpongeBob HeroPants', 3, 16,  '2019-06-03', '2019-06-23'),
	(22, 'SpongeBob HeroPants', 3, 17,  '2019-06-03', '2019-06-23'),
	(22, 'SpongeBob HeroPants', 3, 18,  '2019-06-03', '2019-06-23'),
	(22, 'SpongeBob HeroPants', 3, 19,  '2019-06-03', '2019-06-23'),
	(22, 'SpongeBob HeroPants', 3, 20,  '2019-06-03', '2019-06-23'),
	(22, 'SpongeBob HeroPants', 3, 21,  '2019-06-03', '2019-06-23'),
	(30,'LEGO Star Wars FA', 3, 22,  '2019-06-03', '2019-06-23'),
	(26,'Mario Bros. Wii', 3, 22,  '2019-06-03', '2019-06-23'),
	(22, 'SpongeBob HeroPants', 3, 22,  '2019-06-03', '2019-06-23'),
	(35, 'Mortal Kombat 11', 4, 23,  '2019-06-03', '2019-06-23'),
	(34, 'Vampyr', 4, 24,  '2019-06-03', '2019-06-23'),
	(38, 'Vampire: TM', 4, 24,  '2019-06-03', '2019-06-23'),
	(32, 'XCOM', 4, 24,  '2019-06-03', '2019-06-23'),
	(35, 'Mortal Kombat 11', 4, 24,  '2019-06-02', '2019-06-22'),
	(39, 'Halo 3', 4, 25,  '2019-06-02', '2019-06-22'),
	(35, 'Mortal Kombat 11', 4, 25,  '2019-06-02', '2019-06-22')
;
