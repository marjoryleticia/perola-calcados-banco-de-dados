
CREATE TABLE Cliente (
    id_cliente INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

INSERT INTO Cliente (nome, email, telefone)
VALUES
('	Catarine Lopes', '	catarinelopes@email.com', '(81)99999-1111'),
('	Leyliane  Cristina', 'criatina@email.com', '(81)99999-2222'),
('Ana Costa', 'ana@email.com', '(81)99999-3333');


SELECT * FROM Cliente;

CREATE TABLE Categoria (
    id_categoria INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL
);

INSERT INTO Categoria (nome_categoria)
VALUES
('Tênis'),
('Rasteiras'),
('SCARPIN'),
('ANABELA'),
('Botas'),
('Sapatilhas'),
('Mocassim'),
('Saltos');

CREATE TABLE Produto (
    id_produto INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INTEGER NOT NULL,
    id_categoria INTEGER,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

INSERT INTO Produto (nome, preco, estoque, id_categoria)
VALUES
('Tênis ', 260.90, 10, 1),
('Rasteira basica', 230.90, 15, 2),
('SCARPIN-Chanel', 249.90, 8, 3),
('ANABELA CEPA', 280.00, 30, 4),
('Bota CANO CURTO', 290.00, 5, 5),
(' SAPTILHA-CHANEL', 239.90, 15, 6),
(' 	Mocassim NATUREZA ', 250.90, 15, 7),
(' 	SALTO RETO ', 289.90, 15,8);

SELECT * FROM Categoria;
SELECT * FROM Produto;

CREATE TABLE Pedido (
    id_pedido INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10,2),
    id_cliente INTEGER NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);
INSERT INTO Pedido (data_pedido, valor_total, id_cliente)
VALUES
('2025-06-01', 260.90, 1),
('2025-06-02', 480.80, 2),
('2025-06-03', 249.90, 3);
SELECT
    c.nome,
    p.id_pedido,
    p.valor_total
FROM Cliente c
INNER JOIN Pedido p
ON c.id_cliente = p.id_cliente;
CREATE TABLE Fornecedor (
    id_fornecedor INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

INSERT INTO Fornecedor (nome, telefone)
VALUES
('Nike Brasil', '(11)1111-1111'),
('Via Marte', '(11)2222-2222'),
('Beira Rio', '(11)3333-3333'),
('Vizzano', '(11)4444-4444'),
('Moleca', '(11)5555-5555');

CREATE TABLE Pagamento (
    id_pagamento INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    forma_pagamento VARCHAR(50),
    valor DECIMAL(10,2),
    data_pagamento DATE,
    id_pedido INTEGER,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);


INSERT INTO Pagamento (forma_pagamento, valor, data_pagamento, id_pedido)
VALUES
('Pix', 260.90, '2025-06-01', 1),
('Cartão de Crédito', 480.80, '2025-06-02', 2),
('Boleto', 249.90, '2025-06-03', 3);
CREATE TABLE Entrega (
    id_entrega INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    endereco VARCHAR(200),
    status VARCHAR(50),
    data_entrega DATE,
    id_pedido INTEGER,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

INSERT INTO Entrega (endereco, status, data_entrega, id_pedido)
VALUES
('Rua JOASÉ ASUGUASTO FILHO, 41', 'Entregue', '2025-06-05', 1),
('Rua CORONEL , 200', 'Em transporte', '2025-06-06', 2),
('Rua HENRIQUE CHAVIER, 300', 'Preparando envio', '2025-06-07', 3);
CREATE TABLE Item_Pedido (
    id_item INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    quantidade INTEGER NOT NULL,
    subtotal DECIMAL(10,2),
    id_pedido INTEGER,
    id_produto INTEGER,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

INSERT INTO Item_Pedido (quantidade, subtotal, id_pedido, id_produto)
VALUES
(1, 260.90, 1, 1),
(2, 480.80, 2, 2),
(1, 249.90, 3, 3);

--CONSUTAS SQL
SELECT * 
FROM Produto
WHERE preco > 250;--ESTA FILTRANDO

SELECT *
FROM Produto
ORDER BY preco DESC;--classificar e organizar

SELECT
    c.nome,
    p.id_pedido,
    p.valor_total
FROM Cliente c
INNER JOIN Pedido p
ON c.id_cliente = p.id_cliente;--combinar linhas de duas ou mais tabelas

SELECT
    c.nome,
    p.id_pedido
FROM Cliente c
LEFT JOIN Pedido p
ON c.id_cliente = p.id_cliente;-- registros da tabela da esquerda

SELECT COUNT(*) AS total_clientes
FROM Cliente;

SELECT AVG(preco) AS preco_medio
FROM Produto;--VER MEDIA

SELECT MAX(preco) AS maior_preco
FROM Produto;

SELECT
    id_categoria,
    COUNT(*) AS quantidade_produtos
FROM Produto
GROUP BY id_categoria;--agrupa 


ALTER TABLE Produto
ADD COLUMN id_fornecedor INTEGER;

ALTER TABLE Produto
ADD CONSTRAINT fk_fornecedor
FOREIGN KEY (id_fornecedor)
REFERENCES Fornecedor(id_fornecedor);
ALTER TABLE Produto
ADD CONSTRAINT fk_fornecedor
FOREIGN KEY (id_fornecedor)
REFERENCES Fornecedor(id_fornecedor);

SELECT
    p.nome AS produto,
    c.nome_categoria,
    p.preco
FROM Produto p
INNER JOIN Categoria c
ON p.id_categoria = c.id_categoria; 
