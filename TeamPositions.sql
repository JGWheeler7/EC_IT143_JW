DROP VIEW IF EXISTS TeamPositions;
GO

CREATE VIEW TeamPositions AS

/*****************************************************************************************************************

NAME: TeamPositions
PURPOSE: shows everyones positions
MODIFICATION LOG:
Ver		Date		Author		Description
-----	----------	-----------
-------------------------------------------------------------------------------
1.0		05/23/2022	JJAUSSI		1. Built this script for EC IT440

RUNTIME:
0m 0s

NOTES:
Creates a view that allows us to call for the team positions
******************************************************************************************************************/

--Q: Can I get a list of the player names and their positions without so much query?
--A: A view was created to view the players positions

SELECT p.pl_name, po.p_name FROM tblPlayerDim AS p
RIGHT JOIN tblPositionDim AS po ON p.p_id = po.p_id;