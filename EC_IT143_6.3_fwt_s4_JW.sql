CREATE TRIGGER last_mod ON dbo.t_hello_world
AFTER UPDATE
AS

/*****************************************************************************************************************


NAME: Fun with Triggers
PURPOSE: To practice triggers and have fun
MODIFICATION LOG:
Ver Date Author Description
-----	----------	-----------		-------------------------------------------------------------------------------
1.0		05/23/2022	JJAUSSI			1. Built this script for EC IT440

RUNTIME:
0m 1s

NOTES:
Practice triggers within SQL Server


******************************************************************************************************************/

BEGIN
	UPDATE dbo.t_hello_world
		SET
			last_modified_date = GETDATE()
		WHERE My_Message IN
		(
			SELECT DISTINCT
					My_Message
				FROM Inserted
		);
END