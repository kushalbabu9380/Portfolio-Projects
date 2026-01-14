Select * From Orders;
Select * From OrderDetails;

Select TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'Base Table';


Select COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Orders';

--Orders Table--
CREATE OR ALTER VIEW vw_Orders_Cleaned AS 
SELECT 
     OrderID,
	 CustomerID,
	 EmployeeID,
	 CAST (OrderDate AS DATE) AS OrderDate,
	 ShipRegion,
	 ShipVia
From Orders
Where OrderDate IS NOT NULL;

SELECT * FROM vw_Orders_Cleaned;


Select COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'OrderDetails';


CREATE VIEW vw_OrdersDetail_Cleaned AS
SELECT 
     OrderID,
	 ProductID,
	 UnitPrice,
	 Quantity,
	 Discount,
	 (Quantity * Unitprice * (1- Discount)) AS Total_Sales
From OrderDetails;

SELECT * FROM vw_OrdersDetail_Cleaned;


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Customers';


SELECT * FROM Customers;


CREATE VIEW vw_Customers_Cleaned AS
SELECT
    CustomerID,
    CompanyName,
    ContactName,
    City,
    Country,
    ISNULL(Region, 'Unknown') AS Region
FROM Customers;

SELECT * FROM vw_Customers_Cleaned;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Products';


SELECT * FROM Products;

CREATE VIEW vw_Products_Cleaned AS
SELECT
    ProductID,
    ProductName,
    SupplierID,
    CategoryID,
    UnitPrice,
    UnitsInStock,
    Discontinued
FROM Products
WHERE Discontinued = 0;

Select * from vw_Products_Cleaned;


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Employees';

SELECT * FROM Employees;

CREATE VIEW vw_Employees_Cleaned AS
SELECT
    EmployeeID,
    FirstName + ' ' + LastName AS EmployeeName,
    Title,
    Country
FROM Employees;

SELECT * FROM vw_Employees_Cleaned;


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Categories';


SELECT * FROM Categories;

CREATE VIEW vw_Categories_Cleaned AS
SELECT
    CategoryID,
    CategoryName
FROM Categories;

Select * from vw_Categories_Cleaned;


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Shippers';

Select * From Shippers;

CREATE VIEW vw_Shippers_Cleaned AS
SELECT
    ShipperID,
    CompanyName AS ShipperName
FROM Shippers;

Select * from vw_Shippers_Cleaned;


SELECT * FROM vw_Orders_Cleaned;
SELECT * FROM vw_OrdersDetail_Cleaned;
SELECT * FROM vw_Employees_Cleaned;
SELECT * FROM vw_Products_Cleaned;
SELECT * FROM vw_Shippers_Cleaned;
SELECT * FROM vw_Customers_Cleaned;
SELECT * FROM vw_Categories_Cleaned;

Select * FROM Categories;


CREATE OR ALTER VIEW vw_Orders_CleanedMON AS
SELECT
    OrderID,
    CustomerID,
    EmployeeID,
    CAST(OrderDate AS DATE) AS OrderDate,      -- pure date
    YEAR(OrderDate) AS OrderYear,              -- year
    MONTH(OrderDate) AS OrderMonth,            -- month number
    DATENAME(MONTH, OrderDate) AS OrderMonthName,
    FORMAT(OrderDate, 'yyyy-MM') AS YearMonth, -- best for charts
    ShipCountry,
    ISNULL(ShipRegion, 'Unknown') AS ShipRegion,
    ShipVia
FROM Orders
WHERE OrderDate IS NOT NULL;

SELECT * From vw_Orders_CleanedMON;

Select * FROM Employees;