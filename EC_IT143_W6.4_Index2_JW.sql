/*
Missing Index Details from SQLQuery10.sql - PURAHPAD.AdventureWorks2022 (PURAHPAD\jake (58))
The Query Processor estimates that implementing the following index could improve the query cost by 93.2298%.
*/


USE [AdventureWorks2022]
GO
CREATE NONCLUSTERED INDEX IX_City
ON [Person].[Address] ([City])

GO

