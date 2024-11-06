--QUESTAO 1
SELECT TOP(100)
SalesAmount
FROM FactSales
ORDER BY SalesAmount DESC
--QUESTAO 2

SELECT TOP(10)
UnitPrice,
Weight,
Size
FROM DimProduct
ORDER BY UnitPrice DESC,Weight,AvailableForSaleDate ASC

--QUESTÃO 3
SELECT
ProductName,
Weight
FROM DimProduct
WHERE Weight > 100
ORDER BY Weight DESC
--QUESTAO 4
SELECT
StoreName,
Employeecount,
OpenDate
FROM DimStore
WHERE StoreType = 'STORE' AND Status = 'on'
--questao 5
SELECT *
FROM DimProduct
WHERE BrandName = 'nome' 

--questao 6
SELECT *FROM DimStore
WHERE CloseDate is not null

--questao 7
SELECT * FROM DimStore
WHERE Employee 

--questao 8
SELECT * FROM DimProduct
WHERE ProductDescription LIKE '%LCD%'

--questao 9
SELECT * FROM DimProduct
WHERE ColorName IN('GREEN', 'ORANGE', 'BLACK','silver',

--QUESTAO 10
SELECT * FROM DimProduct
WHERE BrandName =
--

SUM=somar linhas   SUM(SKFHKSFHJ)
COUNT=contar linhas  COUNT(^)
AVG=calcula media AVG(^)
MiN=menor valor MIN(^)
MAX=maior valor MAX(^)
