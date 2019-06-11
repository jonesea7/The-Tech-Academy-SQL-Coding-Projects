CREATE DATABASE jones_game_lib;

/*======  CREATE MANUFACTURER TABLE ID(100)======*/

CREATE TABLE tbl_mfr (
	mfr_id INT PRIMARY KEY not null IDENTITY (100,1),
	mfr_name VARCHAR(15) NOT NULL
);

INSERT INTO tbl_mfr
	(mfr_name)
	VALUES
	('Nintendo'),
	('Microsoft'),
	('Sony'),
	('Sega')
;

/*======  CREATE CONSOLE TABLE ID(200)======*/

CREATE TABLE tbl_console(
	console_id INT PRIMARY KEY NOT NULL IDENTITY (200,1),
	console_mfr INT CONSTRAINT fk_console_mfr FOREIGN KEY REFERENCES tbl_mfr(mfr_id) ON UPDATE CASCADE ON DELETE CASCADE,
	console_name VARCHAR(20) NOT NULL
);
	/*======  INSERT SYSTEMS OVER THE YEARS AS VALUES ======*/

INSERT INTO tbl_console
	(console_mfr, console_name)
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

CREATE TABLE tbl_genre (
	genre_id INT PRIMARY KEY not null IDENTITY (200,1),
	genre_type VARCHAR(15) NOT NULL
);

/*======  VALUES: ABBREVIATED WORDS OF THE GENRES (6 letters or less?) ======*/
INSERT INTO tbl_genre
	(genre_type)
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

CREATE TABLE tbl_esrb (
	esrb_id INT PRIMARY KEY NOT NULL IDENTITY (300,10),
	esrb_rating VARCHAR(5) NOT NULL
);

	/*======  VALUES: eC E E+10 T M Ao ======*/

INSERT INTO tbl_esrb
	(esrb_rating)
	VALUES
	('eC'),
	('E'),
	('E+10'),
	('T'),
	('M'),
	('Ao')
;

/*======  CREATE GAME INFORMER SCORE TABLE ID(400) ======*/

	/*======  VALUES: 1/10 - 10/10 ======*/

/*======  CREATE FAMILY SCORE TABLE ID(500) 10/10 SCALE ======*/

	/*======  VALUES: 1/10 - 10/10 ======*/

/*======  CREATE PUBLISHER TABLE ID(600) ======*/

	/*======  VALUES: SONY, SEGA, ATLUS, ETC. ======*/

/*======  CREATE DEVELOPER TABLE ID(700) ======*/

	/*======  VALUES: i.e. INSOMNIAC, NINTENDO, NAUGHTY DOG, ETC. ======*/

/*======  FOREIGN KEYED TABLE WITH ALL THE TABLES LINKED ABOVE ======*/

CREATE TABLE tbl_titles (
	title_id INT PRIMARY KEY not null IDENTITY (1,1),
	title_game varchar(50),
	title_mfg 
	title_console
	title_genre
	title_esrb
	title_gi_score
	title_pub
	title_dev
	
);

/*======  ANOTHER FOREIGN KEYED TABLE LISTING MY FAVORITE GAMES WITH ONLY A FEW OF THE PARAMETERS THE SAME AS TABLES ABOVE ======*/










/*====== THIS IS THE TABLE THAT WILL HOLD THE FK MAPPING ======*/



CREATE TABLE tbl_favs (
	favs_id INT PRIMARY KEY not null IDENTITY (1,1),
);