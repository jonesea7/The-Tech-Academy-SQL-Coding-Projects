CREATE DATABASE jones_game_lib;

/*======  CREATE MANUFACTURER TABLE ID(100)======*/

	/*======  INSERT NINTENDO, MS, SONY, SEGA AS VALUES ======*/

/*======  CREATE CONSOLE TABLE ID(200) ======*/

CREATE TABLE tbl_console (
	console_id INT PRIMARY KEY not null IDENTITY (200,1),
	console_name varchar(10)
);
	

	/*======  VALUES WILL BE ALL THE SYSTEMS OVER THE YEARS FOR EACH MFG ======*/
	con_nes
	con_snes
	con_n64
	con_gc
	con_wii
	con_wU
	con_swtch
	con_xb
	con_xb360
	con_xb1
	con_psx
	con_ps2
	con_ps3
	con_ps4
	con_gen
	con_cd

/*======  CREATE GENRE TABLE ID(300) ======*/

CREATE TABLE tbl_genre (
	genre_id INT PRIMARY KEY not null IDENTITY (300,1)
	genre_fps
	genre_srpg
	genre_jrpg
	genre_wrpg
	genre_sports
	genre_fighting
	genre_coop
	genre_pltfrm
	genre_oldskl
	genre_racing
);
	/*======  VALUES: ABBREVIATED WORDS OF THE GENRES (4 letters or less?) ======*/

/*======  CREATE ESRB RATING TABLE ID(400) ======*/

	/*======  VALUES: eC E E+10 T M Ao ======*/

/*======  CREATE GAME INFORMER SCORE TABLE ID(500) ======*/

	/*======  VALUES: 1/10 - 10/10 ======*/

/*======  CREATE FAMILY SCORE TABLE ID(600) 10/10 SCALE ======*/

	/*======  VALUES: 1/10 - 10/10 ======*/

/*======  CREATE PUBLISHER TABLE ID(700) ======*/

	/*======  VALUES: SONY, SEGA, ATLUS, ETC. ======*/

/*======  CREATE DEVELOPER TABLE ID(800) ======*/

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





/*====== CREATE TABLE FOR MFG ======*/

CREATE TABLE tbl_con_mfg (
	con_mfg_id INT PRIMARY KEY not null IDENTITY (100,1),
	Nintendo,
	Microsoft,
	Sony,
	Sega,

);




/*====== THIS IS THE TABLE THAT WILL HOLD THE FK MAPPING ======*/



CREATE TABLE tbl_favs (
	favs_id INT PRIMARY KEY not null IDENTITY (1,1),
);