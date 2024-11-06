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
HAVING SalesQuantity > 5000
--QUAESTAO 3
SELECT
CustomerKey,
(COUNT(SalesQuantity)) AS 'QUANT_DE_VENDA'	
FROM FactOnlineSales
GROUP BY CustomerKey
ORDER BY COUNT(SalesQuantity) DESC

--B
SELECT
CustomerKey,
COUNT(SalesQuantity) AS 'QUANT_DE_VENDA'	
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
GROUP BY StockTypeName
--QUESTAO 6
SELECT
ColorName,
BrandName
FROM DimProduct
GROUP BY BrandName,ColorName
ORDER BY BrandName
--QUESTAO 7
