CREATE DATABASE GameLibrary2019

 --Welcome to my personal gaming library network.
 --You will find several comments to indicate the challenges set forth by the assignment
 --I will use '--**' to denote a line of code is connected to a challenge to make it easier for you to identify what is required of me to complete the assignment
 --I've added more tables than required that are just for my enjoyment.

/* ======= CREATE A BRANCH/OWNER TABLE =======*/

	--COLUMNS ownerID, ownerName, ownerAddress
USE GameLibrary2019

CREATE TABLE OWNER_BRANCH (
	ownerID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	ownerName VARCHAR(30) NOT NULL, 
	ownerAddress VARCHAR(1000) NOT NULL,
);

SELECT * FROM OWNER_BRANCH;

/* ====== BORROWER TABLE ===== */
--COLUMNS borrowerID, borrowerFName, lastname, borrowerAddress, borrowerPhone

CREATE TABLE BORROWER (
	borrowerID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	borrowerFirName VARCHAR(30) NOT NULL,
	borrowerLasName VARCHAR(50) NOT NULL,
	borrowerAddress VARCHAR(1000) NOT NULL,
	borrowerPhone VARCHAR(30) NOT NULL
);

SELECT * FROM BORROWER;

/*======  CREATE PUBLISHER TABLE ID(500) ======*/

CREATE TABLE PUBLISHER (
	pubID INT PRIMARY KEY NOT NULL IDENTITY(500,1),
	pubName VARCHAR(30) NOT NULL,
	pubCountry VARCHAR(30) NOT NULL,
	pubPhone VARCHAR(50) NOT NULL

);

/*======  CREATE DEVELOPER TABLE ID(600) ======*/

	--minor tweak instead of referencing the game with:
	--gameID INT NOT NULL CONSTRAINT fkDevGameID FOREIGN KEY REFERENCES GAME(gameID),
	--I've decided to link the game to the dev since some developers make most of the games
	--this will keep the developer table manageable

CREATE TABLE DEVELOPER (
	devId INT NOT NULL PRIMARY KEY IDENTITY (600,1),
	devName VARCHAR(100) NOT NULL
);
 
 SELECT * FROM DEVELOPER
 
CREATE TABLE GAME (
	gameID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	gameTitle VARCHAR(100) NOT NULL,
	gamePub INT NOT NULL CONSTRAINT fkGamePubID FOREIGN KEY REFERENCES PUBLISHER(pubID),
	gameDev INT NOT NULL CONSTRAINT fkGameDevID FOREIGN KEY REFERENCES DEVELOPER(devID)

);


CREATE TABLE COPIES_GAME (
	gameID INT NOT NULL CONSTRAINT fkCopiesGameID FOREIGN KEY REFERENCES GAME(gameID),
	ownerID INT NOT NULL CONSTRAINT fkCopiesOwnerID FOREIGN KEY REFERENCES OWNER_BRANCH(ownerID),
	numCopies INT NOT NULL
);

CREATE TABLE LOANS_GAME (
	gameID INT NOT NULL CONSTRAINT fkLoansGameID FOREIGN KEY REFERENCES GAME(gameID),
	ownerID INT NOT NULL CONSTRAINT fkLoansOwnerID FOREIGN KEY REFERENCES OWNER_BRANCH(ownerID),
	borrowerID INT NOT NULL CONSTRAINT fkLoansBorID FOREIGN KEY REFERENCES BORROWER(borrowerID),
	dateOut DATE NOT NULL,
	dateDue DATE NOT NULL,
);

SELECT * FROM LOANS_GAME, COPIES_GAME;


/*============================================== VALUES ==========================================================*/

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

/* ======= INSERT VALUES BORROWER ====== */

	--CHALLENGE: 8 borrowers
		

INSERT INTO BORROWER
	(borrowerFirName, borrowerLasName, borrowerAddress, borrowerPhone)
	VALUES
	('Emmanuel', 'Kant','2 Fear','313-555-1222'),
	('Robert', 'Kiyosaki','22 Magic','313-555-1333'),
	('Tim','Ferriss','223 Kingdom Hall','313-555-1444'),
	('Eckhart', 'Tolle','1 Now','313-555-1555'),
	('Robert','Greene','48 Power Lane','313-555-1666'),
	('Zed A.',' Shaw','13 Hard Way','313-555-1777'),
	('Haruki',' Murakami','0 Unknown Blvd.','313-555-1888'),
	('Ayn',' Rand','1000 Fountainhead Dr.','313-555-1999'),
	('George',' Clauson','1 Rich Ave.','313-555-2111'),
	('H. ','Kojima','13 Weirdville','313-555-2222'),
	('Aaron ','Burr','1 Shot','313-555-2333'),
	('Larry G. ','Bowman Jr.','02 Big Poppa Way','313-555-2444'),
	('Alleccia ','Bowman','888 New Way','313-555-2755'),
	('Freddie ','Mercury','712 Bohemia Ave.','313-555-2666'),
	('Guy ','Sandvilles','434 Powder Springs','313-555-2777'),
	('Miles ','Fowler','7 Green Hills Zone','313-555-2888'),
	('Epicurus ','Jones','1 Greek Court','313-555-2999'),
	('Aristotle ','Jackson','1 Greek Circuit','313-555-3111'),
	('Epictetus',' Smith','1 Greek Path','313-555-3222'),
	('Creflo ','Dollar','7 Lucky Way','313-555-3333'),
	('Sean',' Carter','909 Queens Blvd.','313-555-3444'),
	('Davis ','Love','6 On Par Dr.','313-555-3555'),
	('Phineas ','Wunder','34 Great Vacation','313-555-3666'),
	('Pedro ','Cemen','12941 Syracuse','313-839-9205'),
	('Serena ','Williams','700 Winning Way','313-555-3888'),
	('Thomas ','Brady','6 Rings Drive','313-555-3999')
;

SELECT * FROM BORROWER;

	/*======  VALUES: SONY, SEGA, ATLUS, ETC. ======*/

INSERT INTO PUBLISHER
	(pubName, pubCountry, pubPhone)
	VALUES
	('Sega', 'Japan', '555-555-5552'),
	('Atlus', 'Japan', '555-555-5553'),
	('Nintendo', 'Japan', '555-555-5554'),
	('Microsoft', 'USA', '555-555-5555'),
	('Sony', 'Japan', '555-555-5556'),
	('Activision', 'USA', '555-555-5557'),
	('THQ', 'USA', '555-555-5558'),
	('Bandai Namco', 'Japan', '555-555-5559'),
	('Konami', 'Japan', '555-555-5551'),
	('SNK', 'Japan', '555-555-5521'),
	('Bethesda', 'USA', '555-555-5522'),
	('Atari', 'USA', '555-555-5523'),
	('MTV', 'USA', '555-555-5524'),
	('WB', 'USA', '555-555-5525'),
	('Disney', 'USA', '555-555-5526'),
	('Square Enix','Japan', '555-555-5878'),
	('EA', 'USA', '555-555-7899'),
	('Sodesco', 'Sweden', '555-555-1234')
	
;

SELECT * FROM PUBLISHER;


/*======  VALUES: i.e. INSOMNIAC, NINTENDO, NAUGHTY DOG, ETC. ======*/

	--ASSIGNMENT CHALLENGE: 'At least 10 developers in DEVELOPER table

	--DEV VALUES must come before the GAME values to populate the table for referencing

INSERT INTO DEVELOPER
	(devName)
	VALUES
	('Activision'),
	('Atari'),
	('Avalanche'),
	('Bandai Namco'),
	('Behaviour'),
	('Bethesda'),
	('D3'),
	('EA'),
	('Good-Feel'),
	('Harmonix'),
	('Hideo Kojima'), --I know it's not the name of his company, the media makes him out to be such a big deal I could not resist.
	('Insomoniac'),
	('Luxoflux'),
	('MTV'),
	('Naughty Dog'),
	('Nintendo'),
	('Pipeworks'),
	('Sega'),
	('Shaba'),
	('SNK'),
	('Spike Chunsoft'),
	('Square Enix'),
	('SuperBot'),
	('Team Ninja'),
	('THQ'),
	('Tornado'),
	('Travellers Tales'),
	('Ubisoft')
;

SELECT * FROM DEVELOPER;

/* ======= VALUES: GAMES ====== */

	--CHALLENGE: at least 20 Games in the GAME table.
	
INSERT INTO GAME
	(gameTitle, gamePub, gameDev)
	VALUES	
	('AMF Bowling', 502, 600),
	('Astro Boy', 502, 600),
	('Avatar: Last Airbender', 502, 600), 
	('Battle Fantasia', 503, 600),
	('Dark Kingdom', 504, 600),
	('Disney Infinity', 514, 625),
	('Doods Big Adventure', 506, 603),
	('Dragonball Z Budokai', 507, 603),
	('Drawn to Life: NC', 506, 626),
	('Elder Scrolls V: Skyrim', 510, 605),
	('Eternal Sonata', 507, 603),
	('FlingSmash', 502, 615),
	('Genji', 504, 615),
	('Ghost Squad', 500, 617),
	('J-Stars Victory', 507, 603),
	('Kirbys Epic Yarn', 502, 615),
	('Lego Dimensions', 513, 626),
	('Lego Star Wars FA', 513, 626),
	('Lightning Returns', 515, 621),
	('Links Crossbow Training', 502, 615),
	('Metal Gear Solid V', 508, 610),
	('Metroid: OM', 502, 615),
	('PS All-Stars', 504, 611),
	('Reckoning', 516, 611),
	('RedSteel', 509, 627),
	('Rockband 2', 512, 609),
	('Rockband 3', 512, 609),
	('Rockband Beatles', 512, 609),
	('Rogue Stormers', 517, 622),
	('SNK Arcade Classics V.1', 509, 619),
	('Sonic Generations', 500, 617),
	('Soul Calibur IV', 507, 603),
	('Spider-Man:WOS', 505, 600),
	('Super Mario Bros. Wii', 502, 615),
	('Super Smash Bros. Ult.', 502, 615),
	('Thrillville', 502, 615),
	('Transformers:ROTF', 505, 600),
	('Wario Land Shake It', 502, 615),
	('Wii Fit', 502, 615),  
	('Wii Fit Plus', 502, 615),
	('Wii Sports Resort', 502, 615),
	('WiiPlay', 502, 615),
	('Zone of the Enders', 502, 610)
;

SELECT * FROM GAME, OWNER_BRANCH;

	
	/* ======= INSERT VALUES FOR COPIES TABLE =======*/
	
	--CHALLENGE: "Kirby's Epic Yarn" in "Phoenix" Branch
	--CHALLENGE: each owner/branch has a least 10 GAME titles, and two copies of each
	--CHALLENGE: two games developed by HIDEO KOJIMA in EDMUND owner/branch
	
INSERT INTO COPIES_GAME
	(gameID, ownerID, numCopies)
	VALUES
	(2, 1, 23),
	(4, 1, 12),
	(5, 1, 12),
	(7, 1, 12),
	(16, 1, 16), --** "Kirby's Epic Yarn" in "Phoenix" Branch
	(8, 1, 12),
	(9, 1, 12),
	(10, 1, 12),
	(11, 1, 12),
	(18, 1, 12), --** 10 titles for owner1/Phoenix
	(21, 2, 12), --**1/2 hideo kojima in edmund
	(43, 2, 12), --** 2/2 hideo kojima in edmund
	(11, 2, 12),
	(15, 2, 12),
	(20, 2, 12),
	(12, 2, 12),
	(30, 2, 12),
	(23, 2, 12),
	(26, 2, 12),
	(32, 2, 12), --** 10 titles for owner2/Edmund
	(2, 3, 12),
	(3, 3, 12),
	(36, 3, 12),
	(35, 3, 12),
	(31, 3, 12),
	(32, 3, 12),
	(33, 3, 12),
	(34, 3, 12),
	(37, 3, 12),
	(38, 3, 12), --** 10 titles for owner39/Palius
	(39, 3, 12),
	(10, 4, 12),
	(11, 4, 12),
	(12, 4, 12),
	(13, 4, 12),
	(14, 4, 12),
	(15, 4, 12),
	(16, 4, 12),
	(17, 4, 12),
	(18, 4, 12),
	(19, 4, 12), --** 10 titles for owner4/Paris
	(20, 4, 12),
	(21, 4, 12)
;

SELECT * FROM COPIES_GAME inner join GAME on GAME.gameID = COPIES_GAME.gameID


/* ======= INSERT VALUES FOR LOANS TABLE =======*/
	
	--CHALLENGE: 2 borrowers have more than 5 games loaned out
	--CHALLENGE: 50+ loans
	
INSERT INTO LOANS_GAME
	(gameID, ownerID, 
	borrowerID, 
	dateOut, dateDue)
	VALUES
	(15, 2, 5, '2019-06-11', '2019-06-30'),
	(21, 2, 5, '2019-06-11', '2019-06-30'),
	(11, 2, 5, '2019-06-11', '2019-06-30'),
	(23, 2, 5, '2019-06-11', '2019-06-30'),
	(26, 2, 5, '2019-06-11', '2019-06-30'),
	(32, 2, 5, '2019-06-11', '2019-06-30'), --** BORROWER5 HAS 6 GAMES LOANED OUT
	(11, 2, 3, '2019-06-11', '2019-06-30'),
	(11, 2, 4, '2019-06-11', '2019-06-30'),
	(11, 2, 11, '2019-06-11', '2019-06-30'),
	(11, 2, 21, '2019-06-11', '2019-06-30'),
	(14, 4, 21, '2019-06-11', '2019-06-30'),
	(14, 4, 22, '2019-06-11', '2019-06-30'),
	(14, 4,  23, '2019-06-11', '2019-06-30'),
	(14, 4, 24, '2019-06-11', '2019-06-30'),
	(19, 4, 25, '2019-06-11', '2019-06-30'),
	(19, 4, 24, '2019-06-11', '2019-06-30'),
	(19, 4, 23, '2019-06-11', '2019-06-30'),
	(19, 4, 11, '2019-06-11', '2019-06-30'),
	(12, 4, 7, '2019-06-11', '2019-06-30'),
	(13, 4, 7, '2019-06-11', '2019-06-30'),
	(14, 4, 7, '2019-06-11', '2019-06-30'),
	(15, 4, 7, '2019-06-11', '2019-06-30'),
	(16, 4, 7, '2019-06-11', '2019-06-30'),
	(17, 4, 7, '2019-06-11', '2019-06-30'),
	(18, 4, 7, '2019-06-11', '2019-06-30'),
	(19, 4, 7, '2019-06-11', '2019-06-30'), --**BORROWER7 HAD 9 GAMES LOANED OUT
	(9, 1, 13, '2019-06-11', '2019-06-30'),
	(9, 1, 15, '2019-06-11', '2019-06-30'),
	(9, 1, 17, '2019-06-11', '2019-06-30'),
	(9, 1, 18, '2019-06-11', '2019-06-30'),
	(9, 1, 22, '2019-06-11', '2019-06-30'),
	(36, 3, 22, '2019-06-11', '2019-06-30'),
	(36, 3, 23, '2019-06-11', '2019-06-30'),
	(36, 3, 24, '2019-06-11', '2019-06-30'),
	(31, 3, 6, '2019-06-11', '2019-06-30'),
	(31, 3, 7, '2019-06-11', '2019-06-30'),
	(31, 3, 8, '2019-06-11', '2019-06-30'),
	(18, 1, 10, '2019-06-11', '2019-06-30'),
	(18, 1, 12, '2019-06-11', '2019-06-30'),
	(18, 1, 14, '2019-06-11', '2019-06-30'),
	(18, 1, 16, '2019-06-11', '2019-06-30'),
	(18, 1, 18, '2019-06-11', '2019-06-30'), --owner 1
	(17, 1, 17, '2019-06-11', '2019-06-30'), --owner 3
	(3, 3, 17, '2019-06-11', '2019-06-30'),
	(3, 3, 13, '2019-06-11', '2019-06-30'),
	(36, 3, 11, '2019-06-11', '2019-06-30'),
	(36, 3, 14, '2019-06-11', '2019-06-30'),
	(19, 4, 4, '2019-06-11', '2019-06-30'), --owner 4
	(19, 4, 3, '2019-06-11', '2019-06-30'),
	(19, 4, 20, '2019-06-11', '2019-06-30'),
	(19, 4, 21, '2019-06-11', '2019-06-30'),
	(13, 4, 21, '2019-06-11', '2019-06-30'),
	(13, 4, 22, '2019-06-11', '2019-06-30'),
	(13, 4, 25, '2019-06-11', '2019-06-30'),
	(13, 4, 24, '2019-06-11', '2019-06-30'),
	(17, 1, 18, '2019-06-11', '2019-06-15')
;

