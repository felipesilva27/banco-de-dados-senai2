SELECT 
SUM(ReturnQuantity) AS 'QUANT_RET',
SUM(SalesQuantity) AS 'QUANT_VEND'
FROM FactSales
GROUP BY channelKey
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
