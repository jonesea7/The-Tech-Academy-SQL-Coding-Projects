
USE GameLibrary2019

CREATE PROC CopiesOfKirbyInPhoenix
AS
SELECT OWNER_BRANCH.ownerName, COPIES.gameTitle, COPIES.numCopies FROM OWNER_BRANCH
INNER JOIN COPIES ON OWNER_BRANCH.ownerID = COPIES.ownerID
WHERE COPIES.gameTitle = 'Kirby''s Epic Yarn'
GO;

CREATE PROC HowManyKirbies
AS
SELECT GAME.gameTitle, OWNER_BRANCH.ownerName, COPIES_GAME.numCopies
FROM OWNER_BRANCH
INNER JOIN  COPIES_GAME ON COPIES_GAME.ownerID = OWNER_BRANCH.ownerID
INNER JOIN GAME ON COPIES_GAME.gameID = GAME.gameID
WHERE gameTitle = 'Kirbys Epic Yarn';
GO;

CREATE PROC NonBorrowers
AS
SELECT BORROWER.borrowerFirName, BORROWER.borrowerLasName, LOANS_GAME.gameID
FROM BORROWER
FULL OUTER JOIN LOANS_GAME ON LOANS_GAME.borrowerID = BORROWER.borrowerID
WHERE LOANS_GAME.gameID IS NULL
GO;

CREATE PROC DueTodayInPhoenix
AS
SELECT	GAME.gameTitle, 
		BORROWER.borrowerFirName, 
		BORROWER.borrowerLasName,
		BORROWER.borrowerAddress
FROM	OWNER_BRANCH
		INNER JOIN LOANS_GAME
			ON OWNER_BRANCH.ownerID = LOANS_GAME.ownerID
		INNER JOIN BORROWER 
			ON LOANS_GAME.borrowerID = BORROWER.borrowerID
		INNER JOIN GAME
			ON LOANS_GAME.gameID = GAME.gameID
WHERE	( OWNER_BRANCH.ownerName = 'Phoenix'
			AND LOANS_GAME.dateDue = '2019-06-15')
GO;

CREATE PROC BranchGamesLoaned
AS
SELECT	OWNER_BRANCH.ownerName, 
		COUNT(LOANS_GAME.borrowerID) AS 'Games Borrowed'
FROM	OWNER_BRANCH
		INNER JOIN LOANS_GAME
			ON OWNER_BRANCH.ownerID = LOANS_GAME.ownerID
		GROUP BY OWNER_BRANCH.ownerName
GO;

CREATE PROC HighVolumeBorrowers
AS
SELECT	BORROWER.borrowerFirName,
		BORROWER.borrowerLasName,
		BORROWER.borrowerAddress,
		COUNT(LOANS_GAME.borrowerID) AS 'Games Borrowed'
FROM	BORROWER
		INNER JOIN LOANS_GAME
			ON BORROWER.borrowerID = LOANS_GAME.borrowerID
		GROUP BY	BORROWER.borrowerFirName,
					BORROWER.borrowerLasName,
					BORROWER.borrowerAddress
		HAVING COUNT(LOANS_GAME.borrowerID) >5
		
GO;

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

