USE EC_IT143_DA;

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

SET STATISTICS TIME ON

SELECT GETDATE() AS my_date;

--Q1: How to keep track of when a record was last modified?
--A1: This works for the initial INSERT

--ALTER TABLE dbo.t_hello_world
--ADD last_modified_date DATETIME DEFAULT GETDATE();

--Q2: How to keep track of when a record was last modified?
--A2: Use a trigger to keep track AFTER modified
--https://learn.microsoft.com/en-us/sql/t-sql/statements/create-trigger-transact-sql?view=sql-server-ver17

--Q3: Trigger was created and does it work?
--A3: yup! It works!

INSERT INTO t_hello_world(My_Message)
VALUES('Hello World 2'), ('Hello World 3'), ('Legend of Zelda');

UPDATE t_hello_world SET My_Message = 'Illusion'
WHERE My_Message = 'Sleepwalker';

SELECT * FROM t_hello_world;

--Q4: how to keep track of who modifies?
--A4: This works for server user and the insert or update.

--ALTER TABLE t_hello_world
--ADD last_modified_by VARCHAR(50) DEFAULT SUSER_NAME();

SET STATISTICS TIME OFF