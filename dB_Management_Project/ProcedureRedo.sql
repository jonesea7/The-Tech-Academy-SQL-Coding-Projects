--First of all I had to create a new dB for this project because my other one was out of control and had major redundacy issues.


/* So I created this procedure and pasted it into another file on a previous
	version of the database where the table for Game_Copies was just 'COPIES'
	On the new database I created I changed it to 'COPIES_GAME' */

--ROOKIE MISTAKE AT IT'S FINEST

--So what I had before was:


CREATE PROC CopiesOfKirbyInPhoenix
AS
SELECT OWNER_BRANCH.ownerName, COPIES.gameTitle, COPIES.numCopies FROM OWNER_BRANCH
INNER JOIN COPIES ON OWNER_BRANCH.ownerID = COPIES.ownerID
WHERE COPIES.gameTitle = 'Kirby''s Epic Yarn'
GO;


	--So in order for this proc to work of course it needs the correct table name to reference
	--You see in proc below the table is now 'COPIES_GAME'
	--I needed to add a third join as well because in my old dB I had REDUNDANTLY included gameTitle column into the COPIES table
	--
	
	--MOREOVER

	--I saw that my fk in the COPIES_GAME table didn't match the gameID
	--I had Kirby as game ID = 17 when it was actually gameID = 16
	--I stumbled on this format for writing procedures in my deep web dive and I fell in love

	--Here is the code with the updated/correct table name:

CREATE PROC CopiesOfKirbyInPhoenix
AS
SELECT	GAME.gameTitle, 
		COPIES_GAME.numCopies,
		OWNER_BRANCH.ownerName
FROM	GAME
		INNER JOIN COPIES_GAME
			ON GAME.gameID = COPIES_GAME.gameID
		INNER JOIN OWNER_BRANCH
			ON COPIES_GAME.ownerID = OWNER_BRANCH.ownerID
WHERE	(gameTitle = 'Kirbys Epic Yarn'
			AND OWNER_BRANCH.ownerName = 'Phoenix' )
			
GO;

--now onto the last procedure

/* CHALLENGE 7: 'For each game developed by 'Hideo Kojima', retrieve the
				title and number of copies owned by the library branch
				'Phoenix.*/

--the main issue is that the branch 'Phoenix' does not have a copy of a Kojima game.

--The code I had was:

CREATE PROC HideosInPhoenix
AS
SELECT	GAME.gameTitle,
		COPIES_GAME.numCopies
FROM	GAME
		FULL OUTER JOIN DEVELOPER
			ON GAME.gameDev = DEVELOPER.devId
		FULL OUTER JOIN COPIES_GAME
			ON GAME.gameID = COPIES_GAME.gameID
		FULL OUTER JOIN OWNER_BRANCH
			ON COPIES_GAME.ownerID = OWNER_BRANCH.ownerID
WHERE	(DEVELOPER.devName = 'Hideo Kojima'
			AND OWNER_BRANCH.ownerName = 'Phoenix')
GO;

--FIRST I changed the ownerName from 'Phoenix' to 'Edmund (a branch that owns two Kojima games) to make sure my new procedure worked.

--...it did return Metal Gear Solid V and Zone of the Enders


--NEXT I switched the OUTER JOIN methods to INNER JOIN
--I tried to add a statement conataining IS NULL at the end of the WHERE method.


SELECT	GAME.gameTitle,
		COPIES_GAME.numCopies
FROM	GAME
		INNER JOIN DEVELOPER
			ON GAME.gameDev = DEVELOPER.devId
		INNER JOIN COPIES_GAME
			ON GAME.gameID = COPIES_GAME.gameID
		INNER JOIN OWNER_BRANCH
			ON COPIES_GAME.ownerID = OWNER_BRANCH.ownerID
WHERE	( DEVELOPER.devName = 'Hideo Kojima'
			AND OWNER_BRANCH.ownerName = 'Phoenix'
			AND GAME.gameTitle IS NULL ) --THIS IS WHERE I ADDED IT

--HOWEVER that still got me an empty table.


CASE	WHEN GAME.gameTitle IS NULL THEN 'There are no copies of that game at this branch.'


USE GameLibrary20193

DECLARE @numCopies INT

SET @numCopies = (
SELECT	GAME.gameTitle,
		COPIES_GAME.numCopies
FROM	GAME
		INNER JOIN DEVELOPER
			ON GAME.gameDev = DEVELOPER.devId
		INNER JOIN COPIES_GAME
			ON GAME.gameID = COPIES_GAME.gameID
		INNER JOIN OWNER_BRANCH
			ON COPIES_GAME.ownerID = OWNER_BRANCH.ownerID
WHERE	( DEVELOPER.devName = 'Hideo Kojima'
			AND OWNER_BRANCH.ownerName = 'Phoenix')
)

IF		@numCopies IS NULL 
	BEGIN
		PRINT 'There are no copies of his game at this branch'
	END

	/*Msg 116, Level 16, State 1, Line 120
	Only one expression can be specified in 
	the select list when the subquery is not introduced with EXISTS.*/

	--NEXT ATTEMPT


SELECT	
CASE
	WHEN GAME.gameTitle THEN 'NOTHING'
END		AS 'Game Title',
		COPIES_GAME.numCopies
FROM	GAME
		INNER JOIN DEVELOPER
			ON GAME.gameDev = DEVELOPER.devId
		INNER JOIN COPIES_GAME
			ON GAME.gameID = COPIES_GAME.gameID
		INNER JOIN OWNER_BRANCH
			ON COPIES_GAME.ownerID = OWNER_BRANCH.ownerID
WHERE	( DEVELOPER.devName = 'Hideo Kojima'
			AND OWNER_BRANCH.ownerName = 'Phoenix')

--EMPTY TABLE AGAIN, but the title of the column for gameTitle changed to Game Title

--ANOTHER ATTEMPT


SELECT	GAME.gameTitle,
		COPIES_GAME.numCopies
FROM	GAME
		INNER JOIN DEVELOPER
			ON GAME.gameDev = DEVELOPER.devId
		INNER JOIN COPIES_GAME
			ON GAME.gameID = COPIES_GAME.gameID
		INNER JOIN OWNER_BRANCH
			ON COPIES_GAME.ownerID = OWNER_BRANCH.ownerID
WHERE	( DEVELOPER.devName = 'Hideo Kojima'
			AND OWNER_BRANCH.ownerName = 'Phoenix'
);

--I CREATED A PROC WHERE IT WILL LEAVE A MESSAGE IF THE GAME TITLE IS NULL.

DECLARE @GameTitle VARCHAR(30)

SET @GameTitle = (
SELECT	GAME.gameTitle
FROM	GAME
		INNER JOIN DEVELOPER
			ON GAME.gameDev = DEVELOPER.devId
		INNER JOIN COPIES_GAME
			ON GAME.gameID = COPIES_GAME.gameID
		INNER JOIN OWNER_BRANCH
			ON COPIES_GAME.ownerID = OWNER_BRANCH.ownerID
WHERE	( DEVELOPER.devName = 'Hideo Kojima'
			AND OWNER_BRANCH.ownerName = 'Phoenix')
)

IF		@GameTitle IS NULL
BEGIN	
	PRINT	'This game is not at this branch'
END


--ANOTHER ATTEMPT

SELECT	GAME.gameTitle,
		COPIES_GAME.numCopies,
		ISNULL(GAME.gameTitle,'N/A')
FROM	GAME
		INNER JOIN DEVELOPER
			ON GAME.gameDev = DEVELOPER.devId
		INNER JOIN COPIES_GAME
			ON GAME.gameID = COPIES_GAME.gameID
		INNER JOIN OWNER_BRANCH
			ON COPIES_GAME.ownerID = OWNER_BRANCH.ownerID
WHERE	( DEVELOPER.devName = 'Hideo Kojima'
			AND OWNER_BRANCH.ownerName = 'Phoenix'
);