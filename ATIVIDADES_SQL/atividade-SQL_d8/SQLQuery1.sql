DECLARE @valor1 INT
SET @valor1 = 10

DECLARE @valor2 INT
SET @valor2 = 5

--DECLARE @valor3 INT
--SET @valor3 = 34

--DECLARE @valor4 INT
--SET @valor4 = 7

--a)
DECLARE @soma INT
SET @soma = @valor1 + @valor2
--select @soma

--b)
DECLARE @subtracão INT
SET @subtracão = @valor3 - @valor4
--SELECT @subtracão

--c)
DECLARE @multiplicação INT
SET @multiplicação = @valor1 * @valor4
--SELECT @multiplicação

--d)
DECLARE @valor3 FLOAT
SET @valor3 = 34

DECLARE @valor4 FLOAT
SET @valor4 = 7

DECLARE @divisão FLOAT
SET @divisão = @valor3 / @valor4
SELECT ROUND(@divisão, 2)

--2)
--a)
DECLARE @produto char(10)
SET @produto = 'celular'
--SELECT @produto

--b)
DECLARE @quantidade INT
SET @quantidade = 12

--c)
DECLARE @preco FLOAT
SET @preco = 9.99

--d)
DECLARE @faturamento FLOAT
SET @faturamento = @quantidade * @preco
--SELECT @faturamento

SELECT
@produto AS 'produto',
@quantidade AS 'quantidade do produto',
@preco AS 'preço do produto',
@faturamento AS 'faturamento do produto'

--3)
DECLARE @nome VARCHAR(MAX)
DECLARE @data_nasc DATE
DECLARE @num_pets INT
SET @nome = 'André'
SET @data_nasc = '1998-02-10'
SET @num_pets = 2
--SELECT @nome
--SELECT @num_pets
--SELECT FORMAT(CAST(@data_nasc AS DATETIME), 'dd/MM/yyyy') AS 'data'
PRINT 'meu nome é ' + @nome + ' nasci em ' + FORMAT(CAST(@data_nasc AS DATETIME), 'dd/MM/yyyy') + ' e tenho ' + CAST(@num_pets AS VARCHAR(2)) + ' pets'

--4  129)
USE ContosoRetailDW
DECLARE @nome_loja VARCHAR(MAX)
DECLARE @nome_loja2 VARCHAR(MAX)


SET @nome_loja = (SELECT TOP(1) StoreName FROM DimStore WHERE CloseDate <= '2009')
SET @nome_loja2 = (SELECT StoreName FROM DimStore WHERE StoreKey = 129)

PRINT('As lojas fechadas no ano de 2008 foram:' + CAST(@nome_loja + @nome_loja2 AS VARCHAR(MAX)))

----CAST
--SQL_VARIANT_PROPERTY
--FORMAT
--FORMAT(CAST('21/03/31'
--ROUND
--FLOOR ARREDONDA PRA BAIXO
--CEILING ARREDONDA PRA CIMA
--DECLARE @VARNAME TIPO
--SET @VARNAME = 100
--SELECT @VARNAME

--5)
DECLARE @Lampadas VARCHAR(MAX)
SET @Lampadas = ''

SELECT 
 @Lampadas = @Lampadas + ProductName + ', ' + CHAR(10)
FROM DimProduct
WHERE ProductSubcategoryKey = 46
PRINT LEFT(@Lampadas, DATALENGTH(@Lampadas)) 
