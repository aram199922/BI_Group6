CREATE TABLE [ORDERS_RELATIONAL_DB].[dbo].[Categories] (
    [CategoryID] INT NOT NULL,
    [CategoryName] VARCHAR(255),
    [Description] VARCHAR(255)
);

CREATE TABLE [ORDERS_RELATIONAL_DB].[dbo].[Customers] (
    [CustomerID] VARCHAR(255) NOT NULL,
    [CompanyName] VARCHAR(255),
    [ContactName] VARCHAR(255),
    [ContactTitle] VARCHAR(255),
    [Address] VARCHAR(255),
    [City] VARCHAR(255),
    [Region] VARCHAR(255),
    [PostalCode] VARCHAR(255),
    [Country] VARCHAR(255),
    [Phone] VARCHAR(255),
    [Fax] VARCHAR(255)
);

CREATE TABLE [ORDERS_RELATIONAL_DB].[dbo].[Employees] (
    [EmployeeID] INT NOT NULL,
    [LastName] VARCHAR(255),
    [FirstName] VARCHAR(255),
    [Title] VARCHAR(255),
    [TitleOfCourtesy] VARCHAR(255),
    [BirthDate] DATETIME,
    [HireDate] DATETIME,
    [Address] VARCHAR(255),
    [City] VARCHAR(255),
    [Region] VARCHAR(255),
    [PostalCode] VARCHAR(255),
    [Country] VARCHAR(255),
    [HomePhone] VARCHAR(255),
    [Extension] VARCHAR(255),
    [Notes] VARCHAR(255),
    [ReportsTo] INT,
    [PhotoPath] VARCHAR(255)
);

CREATE TABLE [ORDERS_RELATIONAL_DB].[dbo].[OrderDetails] (
    [OrderID] INT NOT NULL,
    [ProductID] INT NOT NULL,
    [UnitPrice] FLOAT,
    [Quantity] INT,
    [Discount] FLOAT
);

CREATE TABLE [ORDERS_RELATIONAL_DB].[dbo].[Orders] (
    [OrderID] INT NOT NULL,
    [CustomerID] VARCHAR(255),
    [EmployeeID] INT,
    [OrderDate] DATETIME,
    [RequiredDate] DATETIME,
    [ShippedDate] DATETIME,
    [ShipVia] INT,
    [Freight] FLOAT,
    [ShipName] VARCHAR(255),
    [ShipAddress] VARCHAR(255),
    [ShipCity] VARCHAR(255),
    [ShipRegion] VARCHAR(255),
    [ShipPostalCode] VARCHAR(255),
    [ShipCountry] VARCHAR(255),
    [TerritoryID] VARCHAR(255)
);

CREATE TABLE [ORDERS_RELATIONAL_DB].[dbo].[Products] (
    [ProductID] INT NOT NULL,
    [ProductName] VARCHAR(255),
    [SupplierID] INT,
    [CategoryID] INT,
    [QuantityPerUnit] VARCHAR(255),
    [UnitPrice] FLOAT,
    [UnitsInStock] INT,
    [UnitsOnOrder] INT,
    [ReorderLevel] INT,
    [Discontinued] VARCHAR(255)
);

CREATE TABLE [ORDERS_RELATIONAL_DB].[dbo].[Region] (
    [RegionID] INT NOT NULL,
    [RegionDescription] VARCHAR(255)
);

CREATE TABLE [ORDERS_RELATIONAL_DB].[dbo].[Shippers] (
    [ShipperID] INT NOT NULL,
    [CompanyName] VARCHAR(255),
    [Phone] VARCHAR(255)
);

CREATE TABLE [ORDERS_RELATIONAL_DB].[dbo].[Suppliers] (
    [SupplierID] INT NOT NULL,
    [CompanyName] VARCHAR(255),
    [ContactName] VARCHAR(255),
    [ContactTitle] VARCHAR(255),
    [Address] VARCHAR(255),
    [City] VARCHAR(255),
    [Region] VARCHAR(255),
    [PostalCode] VARCHAR(255),
    [Country] VARCHAR(255),
    [Phone] VARCHAR(255),
    [Fax] VARCHAR(255),
    [HomePage] VARCHAR(255)
);

CREATE TABLE [ORDERS_RELATIONAL_DB].[dbo].[Territories] (
    [TerritoryID] VARCHAR(255) NOT NULL,
    [TerritoryDescription] VARCHAR(255),
    [RegionID] INT
);

SELECT * FROM [ORDERS_RELATIONAL_DB].[dbo].[Categories]