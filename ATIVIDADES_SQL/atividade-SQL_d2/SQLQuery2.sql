SELECT
SUM(SalesAmount) AS 'quant_vend',
SUM(ReturnAmount) AS 'quant_devol'
FROM FactSales


--questao 2
SELECT
AVG(YearlyIncome) AS 'MEDIA_SALARIO'
FROM DimCustomer
WHERE Occupation = 'profissional'
--QUESTAO 3
SELECT 
MIN(Employeecount) AS 'LOJA_COM_MENOR',
MAX(Employeecount) AS 'LOJA_COM_MAIOR'
FROM DimStore

SELECT TOP(1)
StoreName
Employeecount
FROM DimStore
ORDER BY Employeecount DESC

SELECT TOP(1)
StoreName
Employeecount
FROM DimStore
ORDER BY Employeecount ASC

--RESPOSTA A:325 funcionarios
--RESPOSTA B:Contoso North America Online
--RESPOSTA C:7
--RESPOSTA D:CONTOSO Cheshire Store

--QUESTAO 4
SELECT 
FirstName,
gender = 'F'
FROM DimEmployee

SELECT 
FirstName,
gender = 'M'
FROM DimEmployee


SELECT 
Gender = 'F',
MIN (StartDate),
MIN (FirstName)
FROM DimEmployee
WHERE StartDate = '1996-07-31'
--KIM
SELECT 
Gender = 'm',
MIN (StartDate),
MIN (FirstName)
FROM DimEmployee
WHERE StartDate = '1998-01-26'
--TERRY
SELECT TOP(1)
  EmailAddress,
  FirstName
  YearlyIncome
FROM DimEmployee
WHERE Gender = 'f'

SELECT TOP(1)
  EmailAddress,
  FirstName
  YearlyIncome
FROM DimEmployee
WHERE Gender = 'm'