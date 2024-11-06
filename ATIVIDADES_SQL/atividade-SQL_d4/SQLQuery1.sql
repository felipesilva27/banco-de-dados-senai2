SELECT 
SUM(ReturnQuantity) AS 'QUANT_RET',
SUM(SalesQuantity) AS 'QUANT_VEND',
COUNT(StoreKey) AS 'ID_DA_Loja'
FROM FactSales
GROUP BY channelKey,DateKey,StoreKey
HAVING DateKey = '2007'

SELECT 
SUM(ReturnQuantity)
FROM FactSales
GROUP BY channelKey


--QUESTAO 2
SELECT TOP(10)
COUNT(SalesAmount)
FROM FactSales
GROUP BY ProductKey
HAVING SUM(SalesAmount) >= 5000000
--QUAESTAO 3
SELECT
CustomerKey,
(COUNT(SalesQuantity)) AS 'QUANT_DE_VENDA'	
FROM FactOnlineSales
GROUP BY CustomerKey
ORDER BY COUNT(SalesQuantity) DESC

--B
SELECT TOP(3)
CustomerKey,
SUM(SalesQuantity) AS 'QUANT_DE_VENDA'	
FROM FactOnlineSales
GROUP BY CustomerKey,SalesQuantity


--QUESTAO 4
--A 
SELECT
BrandName,
 COUNT(BrandName)
FROM DimProduct
GROUP BY BrandName
--B
SELECT 
ClassName,
AVG(UnitPrice)
FROM DimProduct
GROUP BY ClassName
--C
SELECT 
ColorName,
COUNT(ColorName),
SUM(Weight)
FROM DimProduct
GROUP BY ColorName
--QUESTAO 5
SELECT
StockTypeName,
SUM(Weight)
FROM DimProduct
WHERE BrandName = 'contoso'
GROUP BY StockTypeName
ORDER BY StockTypeName
--QUESTAO 6
SELECT
COUNT(DISTINCT ColorName),
BrandName
FROM DimProduct
GROUP BY BrandName
--ORDER BY BrandName
--QUESTAO 7
SELECT
AVG(YearlyIncome) AS 'MEDIA_SALARIAL',
COUNT(FirstName)
FROM DimCustomer
GROUP BY Gender
HAVING Gender = 'M'
--HAVING Gender = 'F'
--QUESTAO 8
SELECT
Education,
COUNT(FirstName) AS 'QUANT_CLIENTE',
AVG(YearlyIncome) AS 'MEDIA_SALARIAL'
FROM DimCustomer
WHERE Education IS NOT NULL
GROUP BY Education
--QUESTAO 9
SELECT 
DepartmentName,
COUNT(FirstName) AS 'FUNCIONARIOS'
FROM DimEmployee
WHERE EndDate IS NULL
GROUP BY DepartmentName


--QUESTAO 10
SELECT
DepartmentName,
Title,
SUM(VacationHours)
FROM DimEmployee
WHERE StartDate BETWEEN '1999' AND '2000' AND Gender = 'F' AND DepartmentName IN('Production','Finance','Engineering','Marketing')
GROUP BY Title,DepartmentName


