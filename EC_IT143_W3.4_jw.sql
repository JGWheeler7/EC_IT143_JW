/*****************************************************************************************************************
NAME:    3.4 questions answered
PURPOSE: To answer the question from assignment 3.3

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/23/2022   JJAUSSI       1. Built this script for EC IT440


RUNTIME: 
0m 1s

NOTES: 
This script if for the purpose of answering the questions made and taken from other students as part of a whole script.
 
******************************************************************************************************************/

-- Q1: What is the most common city are our bikes sold?
-- A1: Making a query and making a join and adding up all the total of all the number of sales in each region.

SET statistics time on 

SELECT GETDATE() AS my_date;

SELECT st.TerritoryID, st.Name, COUNT(st.TerritoryID) AS Territory_Count
FROM Sales.SalesTerritory AS st
LEFT JOIN Sales.SalesTerritoryHistory AS th ON st.TerritoryID = th.TerritoryID
GROUP BY st.TerritoryID, st.Name
ORDER BY Territory_Count DESC;

--Q2: What is the list price of the most expensive product we sell?
--A2: List products in decsending to find that largest price.

SELECT pp.ProductID, p.Name, pp.ListPrice
FROM Production.ProductListPriceHistory AS pp
LEFT JOIN Production.Product AS p ON  pp.ProductID = p.ProductID
ORDER BY pp.ListPrice DESC;

--Q3: I'm finding that the stock we have in our stores doesn't match what we have spent. 
	--Can you put together a list of the quantity we bought of each product and the cost?
--A3: query and add the amount of product bought and match it with the inventory we have.

SELECT p.ProductID, p.Quantity AS TotalInventory, SUM(th.Quantity) AS totalTransaction
FROM Production.ProductInventory AS p
LEFT JOIN Production.TransactionHistoryArchive AS th ON p.ProductID = th.ProductID
GROUP BY p.ProductID, p.Quantity
ORDER BY p.ProductID;

--Q4: Which three employees have the highest salaries? Show name and salary.
--A4: Join employee name and salaries and order by desc.

SELECT TOP 3 p.BusinessEntityID, p.FirstName, p.LastName, ph.Rate
FROM Person.Person AS p
LEFT JOIN HumanResources.EmployeePayHistory AS ph ON p.BusinessEntityID = ph.BusinessEntityID
ORDER BY ph.Rate DESC;

--Q5:We are analyzing the effectiveness of our different shipping services.
	--Can you create a list that lists our different shipping methods from most to least expensive ShipRate?
--A5: Join the list of the shipping methods and how much they cost.

SELECT s.ShipMethodID, s.Name, s.ShipBase, s.ShipRate, po.TotalDue
FROM Purchasing.ShipMethod AS s
LEFT JOIN Purchasing.PurchaseOrderHeader AS po ON s.ShipMethodID = po.ShipMethodID
ORDER BY po.ShipMethodID;

--Q6: I'm putting together a surprise birthday party for one of our employees, who has been here for 40 years.
	--I would love to do something to nice for him because he has been a great friend to everyone in the company.
	--Can you provide me a list of everyone's names, phone numbers and their types, and their email address to get the word out? Thanks.
--A6: Join employee's names, numbers and thier types and order them be first name.

SELECT p.FirstName, p.LastName, e.EmailAddress, ph.PhoneNumber
FROM Person.Person AS p 
INNER JOIN Person.EmailAddress AS e ON p.BusinessEntityID = e.BusinessEntityID
INNER JOIN Person.PersonPhone AS ph ON ph.BusinessEntityID = e.BusinessEntityID
ORDER BY p.FirstName, p.LastName ASC;

--Q7: Which tables contain a column named 'ProductID'
--A7: using information schema using a like that searches for productid

SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ProductID';

--Q8: List all columns in Sales.SpecialOffer along with their data types and indicate whether nulls are allowed.
--A8: Using information schema look for the data type along with column name and nulls.

SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SpecialOffer';

SET statistics time off
