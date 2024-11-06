SELECT DISTINCT Colorname
FROM DimProduct

SELECT 
ProductName AS Produto, --SE COLOCAR ASPAS PODE COLOCAR MAIS DE UM PRODUTO
BrandName AS Marca,
ColorName AS Cor
FROM DimProduct
--questao 1
SELECT * 
FROM DimProduct
--2517 produtos

SELECT * 
FROM DimCustomer
--18484 clietes o ultimo foi jesus entao reduziu

--questao 2
--a
SELECT CustomerKey, FirstName, EmailAddress, BirthDate
FROM DimCustomer

--b
SELECT
CustomerKey AS chave,
FirstName AS primeironome,
EmailAddress AS email,
BirthDate AS aniversario
FROM DimCustomer

--questão 3
--a
SELECT TOP(100) FirstName
FROM DimCustomer

--b
SELECT TOP(10)PERCENT FirstName
FROM DimCustomer
--c
SELECT TOP(100) FirstName, EmailAddress, BirthDate
FROM DimCustomer
--d
SELECT
FirstName AS primeironome,
EmailAddress AS email,
BirthDate AS aniversario
FROM DimCustomer
--questao 4
SELECT
Manufacturer
FROM DimProduct
--b
SELECT
Manufacturer AS Investidor
FROM DimProduct
--questao 5
SELECT *
FROM DimProduct

SELECT
DISTINCT ProductKey
FROM FactSales
--1 produto nao vendido