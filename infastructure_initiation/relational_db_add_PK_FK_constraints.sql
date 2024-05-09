-- Add Primary Key Constraints
ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Categories] 
    ADD CONSTRAINT PK_Categories PRIMARY KEY (CategoryID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Customers]
    ADD CONSTRAINT PK_Customers PRIMARY KEY (CustomerID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Employees]
    ADD CONSTRAINT PK_Employees PRIMARY KEY (EmployeeID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[OrderDetails]
    ADD CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderID, ProductID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Orders]
    ADD CONSTRAINT PK_Orders PRIMARY KEY (OrderID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Products]
    ADD CONSTRAINT PK_Products PRIMARY KEY (ProductID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Region]
    ADD CONSTRAINT PK_Region PRIMARY KEY (RegionID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Shippers]
    ADD CONSTRAINT PK_Shippers PRIMARY KEY (ShipperID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Suppliers]
    ADD CONSTRAINT PK_Suppliers PRIMARY KEY (SupplierID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Territories]
    ADD CONSTRAINT PK_Territories PRIMARY KEY (TerritoryID);
GO

-- Add Foreign Key Constraints
ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Employees]
    ADD CONSTRAINT FK_Employees_ReportsTo FOREIGN KEY (ReportsTo) REFERENCES dbo.Employees (EmployeeID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[OrderDetails]
    ADD CONSTRAINT FK_OrderDetails_OrderID FOREIGN KEY (OrderID) REFERENCES dbo.Orders (OrderID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[OrderDetails]
    ADD CONSTRAINT FK_OrderDetails_ProductID FOREIGN KEY (ProductID) REFERENCES dbo.Products (ProductID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Orders]
    ADD CONSTRAINT FK_Orders_CustomerID FOREIGN KEY (CustomerID) REFERENCES dbo.Customers (CustomerID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Orders]
    ADD CONSTRAINT FK_Orders_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES dbo.Employees (EmployeeID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Orders]
    ADD CONSTRAINT FK_Orders_ShipVia FOREIGN KEY (ShipVia) REFERENCES dbo.Shippers (ShipperID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Orders]
    ADD CONSTRAINT FK_Orders_TerritoryID FOREIGN KEY (TerritoryID) REFERENCES dbo.Territories (TerritoryID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Products]
    ADD CONSTRAINT FK_Products_CategoryID FOREIGN KEY (CategoryID) REFERENCES dbo.Categories (CategoryID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Products]
    ADD CONSTRAINT FK_Products_SupplierID FOREIGN KEY (SupplierID) REFERENCES dbo.Suppliers (SupplierID);
GO

ALTER TABLE [ORDERS_RELATIONAL_DB].[dbo].[Territories]
    ADD CONSTRAINT FK_Territories_RegionID FOREIGN KEY (RegionID) REFERENCES dbo.Region (RegionID);
GO