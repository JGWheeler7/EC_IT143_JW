DROP VIEW IF EXISTS dbo.v_hello_world_load;
GO

CREATE VIEW dbo.v_hello_world_load
AS

/***********************************************************************************
******************************
NAME: Hello World
PURPOSE: To get the date and time
MODIFICATION LOG:
Ver		Date			Author		Description
-----	----------		-----------
-------------------------------------------------------------------------------
1.0		05/23/2022		JJAUSSI		1. Built this script for EC IT440

RUNTIME:
Xm Xs

NOTES:

***********************************************************************************
*******************************/

--Q: What is the Current Date and Time?

--A: Using SQL Server, we can find out!

SELECT 'Hello World' AS My_Message,
	GETDATE() AS Current_Date_Time




