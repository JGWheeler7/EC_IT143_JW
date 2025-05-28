DROP VIEW IF EXISTS Materials;
GO

CREATE VIEW Materials AS
/***********************************************************************************
******************************
NAME: My Script Name
PURPOSE: My script purpose...
MODIFICATION LOG:
Ver		Date		Author		Description
-----	----------	-----------
-------------------------------------------------------------------------------
1.0		05/23/2022	JJAUSSI		1. Built this script for EC IT440

RUNTIME:
Xm Xs

NOTES:
calling the table of all the materials in hyrule
***********************************************************************************
*******************************/

--Q: Can I get the list of materials without their reference number
--A: A view will be created that shows the name and common locations

SELECT Name, Common_Locations, Common_Locations_2, Cooking_Effects, Hearts_Recovered, Type FROM Hyrule_Compendium_Material
;