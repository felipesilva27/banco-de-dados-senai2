-- Criando o banco de dados chamado LojaDB
CREATE DATABASE LojaDB;
-- Usando o banco de dados LojaDB para as próximas operações
USE LojaDB;
-- Criando a tabela Clientes que armazena os dados dos clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,  -- ClienteID é a chave primária, ou seja, identifica unicamente cada cliente
    NomeCliente VARCHAR(100),   -- Nome do cliente, armazenado como uma string de até 100 caracteres
    Cidade VARCHAR(50)          -- Cidade onde o cliente mora, armazenado como uma string de até 50 caracteres
);

-- Criando a tabela Pedidos que armazena os pedidos feitos pelos clientes
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,   -- PedidoID é a chave primária, identificando unicamente cada pedido
    ClienteID INT,              -- ClienteID é uma chave estrangeira, associando cada pedido a um cliente
    DataPedido DATE,            -- Data do pedido, armazenada como um valor de data
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)  -- ClienteID é uma chave estrangeira que referencia a chave primária da tabela Clientes
);

-- Criando a tabela Produtos que armazena os dados dos produtos disponíveis
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,  -- ProdutoID é a chave primária, identificando unicamente cada produto
    NomeProduto VARCHAR(100),   -- Nome do produto
    CategoriaID INT,  -- CategoriaID é uma chave estrangeira que referencia a tabela Categorias
    Preco DECIMAL(10, 2)        -- Preço do produto, com até 10 dígitos no total e 2 casas decimais
);


-- Criando a tabela Categorias que armazena as categorias dos produtos
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY,  -- CategoriaID é a chave primária, identificando unicamente cada categoria
    NomeCategoria VARCHAR(100)    -- Nome da categoria
);


-- Inserindo clientes na tabela Clientes
INSERT INTO Clientes (ClienteID, NomeCliente, Cidade) VALUES
(1, 'Maria Silva', 'São Paulo'),  -- Cliente com ID 1
(2, 'João Santos', 'Rio de Janeiro'),  -- Cliente com ID 2
(3, 'Ana Costa', 'Belo Horizonte');  -- Cliente com ID 3


-- Inserindo pedidos na tabela Pedidos
INSERT INTO Pedidos (PedidoID, ClienteID, DataPedido) VALUES
(1, 1, '2024-01-15'),  -- Pedido ID 1 feito pelo cliente com ID 1 (Maria Silva)
(2, 2, '2024-01-20'),  -- Pedido ID 2 feito pelo cliente com ID 2 (João Santos)
(3, 1, '2024-02-10');  -- Pedido ID 3 feito pelo cliente com ID 1 (Maria Silva)


-- Inserindo categorias na tabela Categorias
INSERT INTO Categorias (CategoriaID, NomeCategoria) VALUES
(1, 'Eletrônicos'),  -- Categoria com ID 1
(2, 'Vestuário');    -- Categoria com ID 2


-- Inserindo produtos na tabela Produtos
INSERT INTO Produtos (ProdutoID, NomeProduto, CategoriaID, Preco) VALUES
(1, 'Celular', 1, 1500.00),     -- Produto Celular, pertence à categoria Eletrônicos
(2, 'Televisão', 1, 3000.00),   -- Produto Televisão, pertence à categoria Eletrônicos
(3, 'Camiseta', 2, 50.00);      -- Produto Camiseta, pertence à categoria Vestuário


-- Selecionando o banco de dados para uso
USE LojaDB
CREATE TABLE DetalhesPedidos (
    DetalheID INT PRIMARY KEY IDENTITY(1,1),  -- Identificador único para cada linha
    PedidoID INT,                             -- Relaciona com a tabela Pedidos
    ProdutoID INT,                            -- Relaciona com a tabela Produtos
    Quantidade INT,                           -- Quantidade de produtos no pedido
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),  -- Chave estrangeira para Pedidos
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID) -- Chave estrangeira para Produtos);
	)

-- Inserindo detalhes dos pedidos
INSERT INTO DetalhesPedidos (PedidoID, ProdutoID, Quantidade)
VALUES
(1, 1, 2),  -- Pedido 1 contém 2 unidades do Produto 1
(1, 2, 1),  -- Pedido 1 contém 1 unidade do Produto 2
(2, 3, 5),  -- Pedido 2 contém 5 unidades do Produto 3
(3, 2, 2);  -- Pedido 3 contém 2 unidades do Produto 2





















--EXERCICIO 1
SELECT
--DataPedido,
Clientes.NomeCliente,
COUNT(Pedidos.PedidoID)
FROM Clientes
LEFT JOIN Pedidos ON  Clientes.ClienteID = Pedidos.ClienteID
GROUP BY Clientes.NomeCliente;

--questao 2
SELECT 
Clientes.NomeCliente,
SUM(DetalhesPedidos.Quantidade)
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
INNER JOIN DetalhesPedidos ON Pedidos.PedidoID = DetalhesPedidos.PedidoID
GROUP BY Clientes.NomeCliente



--EXERCICIO 3

SELECT Clientes.NomeCliente,
SUM(DetalhesPedidos.Quantidade * Produtos.Preco)
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID
INNER JOIN DetalhesPedidos ON Pedidos.PedidoID = DetalhesPedidos.PedidoID
INNER JOIN Produtos ON DetalhesPedidos.ProdutoID = Produtos.ProdutoID
GROUP BY Clientes.NomeCliente;



--EXERCICIO 4

SELECT Produtos.NomeProduto,
SUM(DetalhesPedidos.Quantidade)
FROM Produtos
INNER JOIN DetalhesPedidos ON Produtos.ProdutoID = DetalhesPedidos.ProdutoID
GROUP BY Produtos.NomeProduto



--exercicio 5

SELECT Pedidos.DataPedido,
SUM(DetalhesPedidos.Quantidade * Produtos.Preco) 
FROM Pedidos
INNER JOIN DetalhesPedidos ON Pedidos.PedidoID = DetalhesPedidos.PedidoID
INNER JOIN Produtos ON DetalhesPedidos.ProdutoID = Produtos.ProdutoID
GROUP BY Pedidos.DataPedido

--EXERCICIO 6
SELECT 
Produtos.NomeProduto,
COUNT(DISTINCT DetalhesPedidos.ProdutoID)
FROM Produtos
INNER JOIN DetalhesPedidos ON Produtos.ProdutoID = DetalhesPedidos.PedidoID 
GROUP BY Produtos.NomeProduto

--EXERCICIO 7
SELECT
Pedidos.PedidoID,
AVG(DetalhesPedidos.Quantidade)
FROM Pedidos
left JOIN DetalhesPedidos ON Pedidos.PedidoID = DetalhesPedidos.Quantidade
GROUP BY Pedidos.PedidoID

--EXERCICIO 8 
SELECT
COUNT(Pedidos.PedidoID),
MONTH(Pedidos.DataPedido)
FROM Pedidos
INNER JOIN DetalhesPedidos ON Pedidos.PedidoID = DetalhesPedidos.PedidoID
GROUP BY YEAR(Pedidos.DataPedido)
ORDER BY Pedidos.DataPedido


