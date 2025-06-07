/*****************************************************************************************************************


NAME: MyFC Final Project
PURPOSE: To answer the stakeholder question
MODIFICATION LOG:
Ver Date Author Description
-----	----------	-----------		-------------------------------------------------------------------------------
1.0		05/23/2022	JJAUSSI			1. Built this script for EC IT440

RUNTIME:
0m 1s

NOTES:
There will be 4 questions in this script followed by their answers.


******************************************************************************************************************/

SET statistics TIME ON

SELECT GETDATE() AS my_date;


-- Q1: I'm working on an analysis of player salaries in the league.
-- Would you provide me with the 3 teams in the league that have the highest number of players 
-- on their roster that make salaries of $175,000 or more? 
-- If you would include how many players each team has that would be ideal.

-- A1: Creating a join with the players names and limiting to only the top 3
-- of the highest salaries along with going through and listing each team the has the highest amount.


SELECT pl_id, pl_name, t_id, mtd_salary, as_of_date
FROM (
	SELECT play.pl_id, play.pl_name, play.t_id, sal.mtd_salary, sal.as_of_date,
		ROW_NUMBER() OVER (PARTITION BY t_id ORDER BY sal.mtd_salary DESC) AS Num
		FROM tblPlayerDim AS play
		LEFT JOIN tblPlayerFact AS sal ON play.pl_id = sal.pl_id 
) AS Ranked
WHERE Num <= 3;

--Q2 Can you show me how many players play each position and their name?
--A2 count each player position and adding it to a total while showing their name

SELECT pl_id, pl_name, p_id, p_name, TotalPositions
	FROM (
		SELECT play.pl_id, play.pl_name, play.p_id, po.p_name,
		ROW_NUMBER() OVER (PARTITION BY play.p_id ORDER BY po.p_name) AS Num,
		COUNT (po.p_name) OVER (PARTITION BY play.p_id) AS TotalPositions
		FROM tblPlayerDim AS play
		LEFT JOIN tblPositionDim AS po ON play.p_id = po.p_id
) AS total;

--Q3: Can you find for me which player had the uniform number 56
--	  and also please include the previous players who have all had that number?
--A3: selecting the name nd unifor and using an order by and group by to show that list

SELECT pl_name, pl_num FROM tblPlayerDim
GROUP BY pl_name, pl_num
ORDER BY pl_num
;

--Q4: Can you give me the a list of people whos team id is 10
	--along with the code for that team?
--A4: Group together names and team id's and joining the table for the code

SELECT play.pl_name, play.t_id, t.t_code FROM tblPlayerDim AS play
LEFT JOIN tblTeamDim AS t ON play.t_id = t.t_id
GROUP BY play.pl_name, play.t_id, t.t_code
ORDER BY play.t_id ASC
;

SET statistics TIME OFF

