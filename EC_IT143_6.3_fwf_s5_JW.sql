CREATE FUNCTION dbo.first_name(@contactname VARCHAR (50))
RETURNS VARCHAR(100)

AS

/*****************************************************************************************************************


NAME: Fun with Functions
PURPOSE: To practice functions and have fun
MODIFICATION LOG:
Ver Date Author Description
-----	----------	-----------		-------------------------------------------------------------------------------
1.0		05/23/2022	JJAUSSI			1. Built this script for EC IT440

RUNTIME:
0m 0s

NOTES:
Function time


******************************************************************************************************************/

BEGIN 
	DECLARE @firstname VARCHAR (100);

	SET @firstname = LEFT(@contactname, CHARINDEX(' ', @contactname + ' ') - 1);

	RETURN @firstname;
END