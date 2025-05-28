CREATE PROCEDURE dbo.usp_hello_world_load
AS

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

BEGIN

-- Reload Data

TRUNCATE TABLE dbo.t_hello_world;

INSERT INTO dbo.t_hello_world
	SELECT v.My_Message,
		v.Current_Date_Time
		FROM dbo.v_hello_world_load AS v;

-- Review Results

SELECT t.*
	FROM dbo.t_hello_world AS t;

END;

GO