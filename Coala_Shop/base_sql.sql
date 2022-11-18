CREATE TABLE Produto (
    codigo_prod integer PRIMARY KEY,
    nome varchar(50),
    preco numeric(3,2),
    tamanhos varchar(10),
    descricao varchar(200),
    qtd_disponivel integer,
    status varchar(10)
);

CREATE TABLE Fornecedor (
    cnpj varchar(14) PRIMARY KEY,
    nome varchar(50),
    email varchar(50),
    telefone varchar(13)
);

CREATE TABLE Usuario (
    cpf varchar(11) PRIMARY KEY,
    nome VARCHAR(50),
    email varchar(100),
    endereco varchar(150),
    telefone varchar(13),
    senha varchar(10),
    admin integer
);

CREATE TABLE Carrinho (
    codigo_carrinho integer PRIMARY KEY,
    fk_Usuario_cpf varchar(11) 
);

CREATE TABLE Pedido (
    codigo_pedido integer PRIMARY KEY,
    enedereco_entrega varchar(150),
    status varchar(10),
    fk_Carrinho_codigo_carrinho integer,
    fk_Usuario_cpf varchar(11) 
);

CREATE TABLE Fatura (
    codigo_fatura integer PRIMARY KEY,
    valor_total numeric(5,2),
    data_vencimento date,
    status varchar(10),
    fk_Pedido_codigo_pedido integer 
);

CREATE TABLE Estoque (
    fk_Produto_codigo_prod integer,
    fk_Fornecedor_cnpj varchar(14)
);

CREATE TABLE Carrinho_produtos (
    fk_Produto_codigo_prod integer,
    fk_Carrinho_codigo_carrinho integer
);
 
ALTER TABLE Carrinho ADD CONSTRAINT FK_Carrinho_2
    FOREIGN KEY (fk_Usuario_cpf)
    REFERENCES Usuario (cpf);
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_2
    FOREIGN KEY (fk_Carrinho_codigo_carrinho)
    REFERENCES Carrinho (codigo_carrinho)
    ON DELETE CASCADE;
 
ALTER TABLE Fatura ADD CONSTRAINT FK_Fatura_2
    FOREIGN KEY (fk_Pedido_codigo_pedido)
    REFERENCES Pedido (codigo_pedido);
 
ALTER TABLE Estoque ADD CONSTRAINT FK_Estoque_1
    FOREIGN KEY (fk_Produto_codigo_prod)
    REFERENCES Produto (codigo_prod)
    ON DELETE SET NULL;
 
ALTER TABLE Estoque ADD CONSTRAINT FK_Estoque_2
    FOREIGN KEY (fk_Fornecedor_cnpj)
    REFERENCES Fornecedor (cnpj)
    ON DELETE SET NULL;
 
ALTER TABLE Carrinho_produtos ADD CONSTRAINT FK_Carrinho_produtos_1
    FOREIGN KEY (fk_Produto_codigo_prod)
    REFERENCES Produto (codigo_prod)
    ON DELETE SET NULL;
 
ALTER TABLE Carrinho_produtos ADD CONSTRAINT FK_Carrinho_produtos_2
    FOREIGN KEY (fk_Carrinho_codigo_carrinho)
    REFERENCES Carrinho (codigo_carrinho)
    ON DELETE SET NULL;