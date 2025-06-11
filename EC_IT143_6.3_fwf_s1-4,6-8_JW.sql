USE EC_IT143_DA;

/*****************************************************************************************************************


NAME: Fun with Functions
PURPOSE: To practice functions and have fun
MODIFICATION LOG:
Ver Date Author Description
-----	----------	-----------		-------------------------------------------------------------------------------
1.0		05/23/2022	JJAUSSI			1. Built this script for EC IT440

RUNTIME:
0m 1s

NOTES:
Practice functions within SQL Server


******************************************************************************************************************/

SET STATISTICS TIME ON

SELECT GETDATE() AS my_date;

--Q1: How to extract first name from contact name?
--A1: well contact name is Maria Anders and you need Maria
--: Search: how to get the first name from a string sql
--https://learn.microsoft.com/en-us/answers/questions/180069/firstname-and-lastname-from-name-in-sql-throwing-e

WITH s1
	AS (
SELECT t.ContactName,
		LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1) AS first_name,
		dbo.first_name(t.ContactName) AS first_name2
FROM dbo.t_w3_schools_customers AS t
	   )
SELECT * FROM s1
WHERE s1.first_name <> s1.first_name2;

--Q2: Can you pull the last name from the contact name?
--A2: Using replace and parsename will allow up to pull the last name.
--https://learn.microsoft.com/en-us/sql/t-sql/functions/parsename-transact-sql?view=sql-server-ver17

WITH s2
	AS (
	SELECT t.ContactName,
	dbo.first_name(t.ContactName) AS first_name,
	PARSENAME(REPLACE(t.ContactName, ' ', '.'), 1) AS last_name
	FROM dbo.t_w3_schools_customers AS t
	)
SELECT * FROM s2;

SET STATISTICS TIME OFF