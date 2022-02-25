CREATE TABLE Pessoa (
    codpessoa int PRIMARY KEY,
    nome varchar(50),
    data_nasc date,
    email varchar(60),
    senha varchar(40)
);

CREATE TABLE Foto (
    codfoto int PRIMARY KEY,
    descricao varchar(200),
    foto OID,
    fk_Pessoa_codpessoa int
);

CREATE TABLE Mensagem (
    codmensagem int PRIMARY KEY,
    data_hora TIMESTAMP,
    texto varchar(500),
    fk_Pessoa_codpessoa int
);

CREATE TABLE E_amigo (
    fk_Pessoa_codpessoa int,
    fk_Pessoa_codpessoa_ int
);

CREATE TABLE Marca (
    fk_Pessoa_codpessoa int,
    fk_Foto_codfoto int
);

CREATE TABLE Curte (
    fk_Pessoa_codpessoa int,
    fk_Mensagem_codmensagem int
);
 
ALTER TABLE Foto ADD CONSTRAINT FK_Foto_2
    FOREIGN KEY (fk_Pessoa_codpessoa)
    REFERENCES Pessoa (codpessoa)
    ON DELETE CASCADE;
 
ALTER TABLE Mensagem ADD CONSTRAINT FK_Mensagem_2
    FOREIGN KEY (fk_Pessoa_codpessoa)
    REFERENCES Pessoa (codpessoa)
    ON DELETE CASCADE;
 
ALTER TABLE E_amigo ADD CONSTRAINT FK_E_amigo_1
    FOREIGN KEY (fk_Pessoa_codpessoa)
    REFERENCES Pessoa (codpessoa)
    ON DELETE CASCADE;
 
ALTER TABLE E_amigo ADD CONSTRAINT FK_E_amigo_2
    FOREIGN KEY (fk_Pessoa_codpessoa_)
    REFERENCES Pessoa (codpessoa)
    ON DELETE CASCADE;
 
ALTER TABLE Marca ADD CONSTRAINT FK_Marca_1
    FOREIGN KEY (fk_Pessoa_codpessoa)
    REFERENCES Pessoa (codpessoa)
    ON DELETE SET NULL;
 
ALTER TABLE Marca ADD CONSTRAINT FK_Marca_2
    FOREIGN KEY (fk_Foto_codfoto)
    REFERENCES Foto (codfoto)
    ON DELETE SET NULL;
 
ALTER TABLE Curte ADD CONSTRAINT FK_Curte_1
    FOREIGN KEY (fk_Pessoa_codpessoa)
    REFERENCES Pessoa (codpessoa)
    ON DELETE SET NULL;
 
ALTER TABLE Curte ADD CONSTRAINT FK_Curte_2
    FOREIGN KEY (fk_Mensagem_codmensagem)
    REFERENCES Mensagem (codmensagem)
    ON DELETE SET NULL;