/*****************************************************************************************************************


NAME: Hyrule Compendium Final Project
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

--Q1:  Could you identify which creatures provide the most valuable recoverable 
	 --materials for cooking effects that restore the most hearts, and in which 
	 --common locations are these high value creatures most frequently found?

--A1: select the cretures table and sort by the highest hearts restored

SELECT c.Name, 
	   c.Common_Locations_1,
	   c.Common_Locations_2, 
	   c.Cooking_Effects, 
	   c.Hearts_Recovered 
FROM Hyrule_Compendium_Creatures AS c

WHERE c.Cooking_Effects = 'Extra Hearts' OR c.Cooking_Effects = 'Heart Recovery'
ORDER BY Hearts_Recovered DESC
;

--Q2:  I need to see which locations have the creatures with most recoverable
	 --materials and the materials with best cooking effects.
	 --I need them organized by type for quick reference.

--A2: Organize and making sure to exclude null values 
	--list the highest recoverable materials and organize by type.

SELECT Name, 
	   Recoverable_Materials_1,
	   Recoverable_Materials_2,
	   Recoverable_Materials_3,
	   Cooking_Effects,
	   Type

FROM Hyrule_Compendium_Creatures
WHERE Recoverable_Materials_2 IS NOT NULL
ORDER BY Recoverable_Materials_3 DESC
;

--Q3: Can you find which location gave loot with that restored the most health?
--A3: Sort by location using restored health descending.

SELECT Reference_Number, Name, Common_Locations_1, Common_Locations_2, Hearts_Recovered FROM Hyrule_Compendium_Creatures
UNION ALL 
SELECT Reference_Number, Name, Common_Locations, Common_Locations_2, Hearts_Recovered FROM Hyrule_Compendium_Material
ORDER BY Hearts_Recovered DESC
;

--Q4: Can you find me which animals show up the most in they hyrule field region?
--A4: Count how many times an animal appears in each are to see which on is the most common.

SELECT Reference_Number, Name, Common_Locations_1, Common_Locations_2
FROM Hyrule_Compendium_Creatures
Where Common_Locations_1 = 'Hyrule Field' OR Common_Locations_2 = 'Hyrule Field'
ORDER BY Reference_Number
;


SET statistics TIME OFF