/*
Missing Index Details from SQLQuery10.sql - PURAHPAD.AdventureWorks2022 (PURAHPAD\jake (58))
The Query Processor estimates that implementing the following index could improve the query cost by 90.7327%.
*/


USE [AdventureWorks2022]
GO
CREATE NONCLUSTERED INDEX IX_OrderQty
ON [Purchasing].[PurchaseOrderDetail] ([OrderQty])
INCLUDE ([DueDate],[ProductID],[UnitPrice],[LineTotal],[ReceivedQty],[RejectedQty],[StockedQty],[ModifiedDate])
GO

