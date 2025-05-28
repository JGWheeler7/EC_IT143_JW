/***********************************************************************************
******************************
NAME: Hello World
PURPOSE: create table
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

DROP TABLE IF EXISTS dbo.t_hello_world;
GO

CREATE TABLE dbo.t_hello_world (
	My_Message VARCHAR (25) NOT NULL,
	Current_Date_Time DATETIME NOT NULL DEFAULT GETDATE(),
	CONSTRAINT PK_t_hello_world PRIMARY KEY CLUSTERED(My_Message ASC)
	);
	GO