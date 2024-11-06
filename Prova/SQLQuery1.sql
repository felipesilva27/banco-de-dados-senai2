CREATE DATABASE Biblioteca;
DROP DATABASE Biblioteca


CREATE TABLE Cliente(
ID_Cliente INT PRIMARY KEY,
Nome_do_Cliente VARCHAR(100),
Idade INT,
data_de_nasc DATE)

CREATE TABLE Livros(
ID_Livro INT PRIMARY KEY,
nome_do_livro VARCHAR(100),
Autor VARCHAR(100),
Data_de_lançamento DATE,
ID_Cliente INT NULL
--FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
)

CREATE TABLE Compra(
ID_da_Compra INT PRIMARY KEY,
Valor_da_Compra INT,
ID_Cliente INT,
ID_Livro INT
--FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
--FOREIGN KEY (ID_Livro) REFERENCES Livros(ID_Livro)
)


INSERT INTO Cliente (ID_Cliente, Nome_do_Cliente, Idade, data_de_nasc)
VALUES (1,'Cristiano Ronaldo', 18, '2004-07-27'),
       (2,'Rainha Elizabeth', 98, '1926-04-14'),
	   (3,'Michael Jackson', 42, '1982-09-26')
        
INSERT INTO Livros (ID_Livro, nome_do_livro, Data_de_lançamento, Autor, ID_Cliente)
VALUES (1,'alice no pais das maravilhas', '2002-02-22', 'Alice Clark', 1),
       (2, 'Reverend Insanity', '2014-07-27','Gu Zhen Ren', 2),
	   (3, 'Shadow Slave', '2018-07-27', 'guilty tree', 3),
	   (4, 'Shounen no Abyss', '2018-07-27', 'Ryo Minenami', 4)

INSERT INTO Compra (ID_da_Compra, Valor_da_Compra, ID_Cliente, ID_Livro)
VALUES (1, '100', 1, 2),
       (2, '110', 2, 4),
	   (3, '200',1,3)

--viws
CREATE VIEW vw_cliente AS
SELECT *
FROM Cliente

CREATE VIEW vw_Livros AS
SELECT *
FROM Livros

CREATE VIEW vw_Compra AS
SELECT *
FROM Compra

--para saber a média de compras do cliente
SELECT 
AVG(Valor_da_Compra) AS 'Média de Preços'
FROM Compra
WHERE ID_Cliente IN (SELECT 
                  ID_Cliente
                   FROM Cliente
				   WHERE  ID_Cliente = 2
				   )


--trigger
CREATE TRIGGER bloqueio 
ON Compra
INSTEAD OF DELETE
AS
BEGIN
PRINT('não permitido')
END

--procedure
CREATE PROCEDURE addCliente
@ID_Cliente NUMERIC,
@Nome_do_Cliente NVARCHAR (100),
@Idade NUMERIC,
@data_de_nasc DATE
AS
INSERT INTO Cliente (ID_Cliente, Nome_do_Cliente, Idade, data_de_nasc)
VALUES (@ID_Cliente,@Nome_do_Cliente, @Idade, @data_de_nasc)



--window funcion
SELECT
ID_Cliente,
SUM(ID_Cliente) OVER (PARTITION BY Valor_da_Compra ORDER BY ID_Cliente) AS 'quantidade de livro comprada'
FROM Compra

