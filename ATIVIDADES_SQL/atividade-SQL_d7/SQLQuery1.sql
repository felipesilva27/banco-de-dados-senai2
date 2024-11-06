--questao 1


--a)
CREATE DATABASE BD_Teste

--b)
DROP DATABASE BD_Teste

--c)
CREATE DATABASE BD_Exercicio

2)
USE BD_Exercicio

create table DCliente(
ID_Cliente INT PRIMARY KEY,
Nome_Cliente VARCHAR(100),
Data_de_Nascimento DATE
)
create table DGerente(
ID_Gerente INT PRIMARY KEY,
Nome_Gerente VARCHAR(100),
Data_de_Contratação DATE,
Salario INT
)



CREATE TABLE Fcontrato(
ID_Contrato INT PRIMARY KEY,
Data_de_Assinatura date,
ID_Cliente INT,
ID_Gerente INT,
Valor_Contrato int
)

--3)
INSERT INTO DCliente(ID_Cliente, Nome_Cliente, Data_de_Nascimento)
VALUES 
(1, 'André martins', '1989-02-12'),
(2, 'Barbara Campos', '1992-05-07'),
(3, 'Carol Freitas', '1985-04-23'),
(4, 'Diogo Cardoso', '1994-10-11'),
(5, 'Eduardo Pereira', '1988-11-09'),
(6, 'Fabiana Silva', '1989-09-02'),
(7, 'Gustavo barbosa', '1993-06-27'),
(8, 'Helen Viana', '1990-02-11')

INSERT INTO DGerente(ID_Gerente, Nome_Gerente, Data_de_Contratação, Salario)
VALUES
(1, 'Lucas Sampaio', '2003-03-21', 6700),
(2, 'Mariana Padilha', '2011-01-10', 9900),
(3, 'Nathalia Santos', '2018-10-03', 7200),
(4, 'Otavio Costa', '2017-04-18', 11000)

INSERT INTO Fcontrato(ID_Contrato, Data_de_Assinatura, ID_Cliente, ID_Gerente, Valor_Contrato)
VALUES
 (1, '2019-01-12', 8, 1, 23000),
 (2, '2019-02-10', 3, 2, 15500),
 (3, '2019-03-07', 7, 2, 6500),
 (4, '2019-03-15', 1, 3, 33000),
 (5, '2019-03-21', 5, 4, 11100),
 (6, '2019-03-23', 4, 2, 5500),
 (7, '2019-03-28', 9, 3, 55000),
 (8, '2019-04-04', 2, 1, 31000),
 (9, '2019-04-05', 10, 4, 3400),
 (10, '2019-04-05', 6, 2, 9200)

 --4)

 INSERT INTO DGerente(ID_Gerente, Nome_Gerente, Data_de_Contratação, Salario)
VALUES
(5, 'Rainha Elizabeth', '1903-03-21', 7000000)

INSERT INTO DCliente(ID_Cliente, Nome_Cliente, Data_de_Nascimento)
VALUES 
(9, 'Moises Abrão', '0001-01-01')

INSERT INTO Fcontrato(ID_Contrato, Data_de_Assinatura, ID_Cliente, ID_Gerente, Valor_Contrato)
VALUES
 (11, '2099-02-27', 9, 5, 230000)

 --5)
 UPDATE Fcontrato
 SET Data_de_Assinatura = '2019-03-17'
 WHERE ID_Contrato = 4


 UPDATE Fcontrato
 SET ID_Gerente = 2
 WHERE ID_Contrato = 4

  UPDATE Fcontrato
 SET Valor_Contrato = 33500
 WHERE ID_Contrato = 4

 --6)
 DELETE 
 FROM Fcontrato
 WHERE ID_Contrato = 11
