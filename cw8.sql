
--zad1
USE AdventureWorks2019
GO
WITH peoplecte
AS
(SELECT * FROM Person.Person),

paycte (BusinessEntityID,Rate)
AS
(SELECT BusinessEntityID,Rate FROM HumanResources.EmployeePayHistory)

SELECT peoplecte.*,Rate INTO TempEmployeeInfo FROM peoplecte
JOIN paycte ON peoplecte.BusinessEntityID=paycte.BusinessEntityID

SELECT * FROM TempEmployeeInfo

--zad2
USE AdventureWorksLT2019
GO
WITH companycte (CustomerID,CompanyContact)
AS
(
SELECT CustomerID,CONCAT(CompanyName,' (',FirstName,' ',LastName,')') AS CompanyContact 
FROM SalesLT.Customer
)
,
pricecte (CustomerID,Revenue)
AS
(
SELECT CustomerID,SUM(TotalDue) As Revenue 
FROM SalesLT.SalesOrderHeader 
GROUP BY CustomerID)
SELECT CompanyContact,Revenue 
FROM companycte 
JOIN pricecte 
ON pricecte.CustomerID=companycte.CustomerID 
ORDER BY CompanyContact

--zad3
WITH productcatcte (ProductCategoryID,Category)
AS(
SELECT ProductCategoryID,Name 
FROM SalesLT.ProductCategory AS Category
),

productcte (ProductID,ProductCategoryID)
AS
(
SELECT ProductID,ProductCategoryID 
FROM SalesLT.Product
),

salescte (ProductID,LineTotal)
AS
(
SELECT ProductID, LineTotal 
FROM SalesLT.SalesOrderDetail
)

SELECT Category,SUM(LineTotal) AS SalesValue 
FROM productcatcte 
INNER JOIN productcte 
ON productcatcte.ProductCategoryID=productcte.ProductCategoryID
 INNER JOIN salescte 
 ON salescte.ProductID = productcte.ProductID 
 GROUP BY Category
