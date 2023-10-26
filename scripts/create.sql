DROP TABLE T_FPP_RECEITA;
DROP TABLE T_FPP_DESPESA;
DROP TABLE T_FPP_SUBCATEGORIA;
DROP TABLE T_FPP_CATEGORIA;
DROP TABLE T_FPP_USUARIO_ENDERECO;
DROP TABLE T_FPP_ENDERECO;
DROP TABLE T_FPP_BAIRRO;
DROP TABLE T_FPP_CIDADE;
DROP TABLE T_FPP_ESTADO;
DROP TABLE T_FPP_TELEFONE;
DROP TABLE T_FPP_INVESTIMENTO;
DROP TABLE T_FPP_TIPO_INVESTIMENTO;
DROP TABLE T_FPP_TIPO_ENDERECO;
DROP TABLE T_FPP_USUARIO;



CREATE TABLE T_FPP_BAIRRO (
    cd_bairro NUMBER(3) NOT NULL,
    cd_cidade NUMBER(3) NOT NULL,
    nm_bairro VARCHAR2(60) NOT NULL
);

ALTER TABLE T_FPP_BAIRRO ADD CONSTRAINT PK_FPP_BAIRRO PRIMARY KEY ( cd_bairro );

CREATE TABLE T_FPP_CATEGORIA (
    cd_categoria VARCHAR2(15) NOT NULL,
    cd_usuario   VARCHAR2(15) NOT NULL,
    id_tipo      NUMBER(3) NOT NULL,
    ds_descricao VARCHAR2(32)
);

ALTER TABLE T_FPP_CATEGORIA ADD CONSTRAINT PK_FPP_CATEGORIA PRIMARY KEY ( cd_categoria );

CREATE TABLE T_FPP_CIDADE (
    cd_cidade NUMBER(3) NOT NULL,
    cd_estado NUMBER(3) NOT NULL,
    nm_cidade VARCHAR2(60) NOT NULL
);

ALTER TABLE T_FPP_CIDADE ADD CONSTRAINT PK_FPP_CIDADE PRIMARY KEY ( cd_cidade );

CREATE TABLE T_FPP_DESPESA (
    cd_despesa      NUMBER(3) NOT NULL,
    cd_usuario      VARCHAR2(15) NOT NULL,
    dt_data         DATE NOT NULL,
    vl_valor        NUMBER(15, 5) NOT NULL,
    nr_metodo       NUMBER(3),
    ds_descricao      VARCHAR2(32) NOT NULL,
    cd_categoria    VARCHAR2(15) NOT NULL,
    cd_subcategoria VARCHAR2(15),
    st_status       NUMBER(3),
    nm_beneficiario VARCHAR2(50)
);

ALTER TABLE T_FPP_DESPESA ADD CONSTRAINT PK_FPP_DESPESA PRIMARY KEY ( cd_despesa );

CREATE TABLE T_FPP_ENDERECO (
    cd_endereco        NUMBER(3) NOT NULL,
    cd_tipo_logradouro NUMBER(3) NOT NULL,
    ds_logradouro      VARCHAR2(60) NOT NULL,
    cd_bairro          NUMBER(3) NOT NULL
);

ALTER TABLE T_FPP_ENDERECO ADD CONSTRAINT PK_FPP_ENDERECO PRIMARY KEY ( cd_endereco );

CREATE TABLE T_FPP_ESTADO (
    cd_estado NUMBER(3) NOT NULL,
    nm_estado VARCHAR2(60) NOT NULL
);

ALTER TABLE T_FPP_ESTADO ADD CONSTRAINT PK_FPP_ESTADO PRIMARY KEY ( cd_estado );

CREATE TABLE T_FPP_INVESTIMENTO (
    cd_investimento NUMBER(3) NOT NULL,
    cd_usuario      VARCHAR2(15) NOT NULL,
    cd_tipo         NUMBER(3) NOT NULL,
    ds_descricao    VARCHAR2(32) NOT NULL,
    vl_valor        NUMBER(15, 5) NOT NULL,
    dt_data         DATE NOT NULL
);

ALTER TABLE T_FPP_INVESTIMENTO ADD CONSTRAINT PK_FPP_INVESTIMENTO PRIMARY KEY ( cd_investimento );

CREATE TABLE T_FPP_RECEITA (
    cd_receita      NUMBER(3) NOT NULL,
    cd_usuario      VARCHAR2(15) NOT NULL,
    dt_data         DATE NOT NULL,
    vl_valor        NUMBER(15, 5) NOT NULL,
    nr_metodo       NUMBER(3),
    ds_descricao    VARCHAR2(32) NOT NULL,
    cd_categoria    VARCHAR2(15) NOT NULL,
    cd_subcategoria VARCHAR2(15),
    st_status       NUMBER(3),
    nm_pagador      VARCHAR2(50)
);

ALTER TABLE T_FPP_RECEITA ADD CONSTRAINT PK_FPP_RECEITA PRIMARY KEY ( cd_receita );

CREATE TABLE T_FPP_SUBCATEGORIA (
    cd_subcategoria VARCHAR2(15) NOT NULL,
    cd_categoria    VARCHAR2(15) NOT NULL,
    cd_usuario      VARCHAR2(15) NOT NULL,
    id_tipo         NUMBER(3) NOT NULL,
    ds_descricao    VARCHAR2(32)
);

ALTER TABLE T_FPP_SUBCATEGORIA ADD CONSTRAINT PK_FPP_SUBCATEGORIA PRIMARY KEY ( cd_subcategoria );

CREATE TABLE T_FPP_TELEFONE (
    cd_telefone VARCHAR2(15) NOT NULL,
    cd_usuario  VARCHAR2(15) NOT NULL,
    ds_tipo     VARCHAR2(30),
    nr_ddi      VARCHAR2(5) NOT NULL,
    nr_ddd      NUMBER(5) NOT NULL,
    nr_numero   VARCHAR2(17) NOT NULL
);

ALTER TABLE T_FPP_TELEFONE ADD CONSTRAINT PK_FPP_TELEFONE PRIMARY KEY ( cd_telefone );

CREATE TABLE T_FPP_TIPO_ENDERECO (
    cd_tipo_logradouro NUMBER(3) NOT NULL,
    ds_descricao       VARCHAR2(60) NOT NULL
);

ALTER TABLE T_FPP_TIPO_ENDERECO ADD CONSTRAINT PK_FPP_TIPO_ENDERECO PRIMARY KEY ( cd_tipo_logradouro );

CREATE TABLE T_FPP_TIPO_INVESTIMENTO (
    cd_tipo      NUMBER(3) NOT NULL,
    ds_descricao VARCHAR2(32) NOT NULL
);

ALTER TABLE T_FPP_TIPO_INVESTIMENTO ADD CONSTRAINT PK_FPP_TIPO_INVESTIMENTO PRIMARY KEY ( cd_tipo );

CREATE TABLE T_FPP_USUARIO (
    cd_usuario    VARCHAR2(15) NOT NULL,
    nm_nome       VARCHAR2(60) NOT NULL,
    dt_nascimento DATE NOT NULL,
    ds_email      VARCHAR2(60) NOT NULL,
    ds_senha      VARCHAR2(60) NOT NULL
);

ALTER TABLE T_FPP_USUARIO ADD CONSTRAINT PK_FPP_USUARIO PRIMARY KEY ( cd_usuario );

CREATE TABLE T_FPP_USUARIO_ENDERECO (
    cd_endereco    NUMBER(3) NOT NULL,
    cd_usuario     VARCHAR2(15) NOT NULL,
    nr_endereco    NUMBER(5) NOT NULL,
    ds_complemento VARCHAR2(60)
);

ALTER TABLE T_FPP_USUARIO_ENDERECO ADD CONSTRAINT PK_FPP_USUARIO_ENDERECO PRIMARY KEY ( cd_endereco );




ALTER TABLE T_FPP_DESPESA
    ADD CONSTRAINT FK_SUBCATEGORIA_DESPESA FOREIGN KEY ( cd_subcategoria )
        REFERENCES T_FPP_SUBCATEGORIA ( cd_subcategoria );

ALTER TABLE T_FPP_BAIRRO
    ADD CONSTRAINT FK_BAIRRO_CIDADE FOREIGN KEY ( cd_cidade )
        REFERENCES T_FPP_CIDADE ( cd_cidade );

ALTER TABLE T_FPP_CIDADE
    ADD CONSTRAINT FK_CIDADE_ESTADO FOREIGN KEY ( cd_estado )
        REFERENCES T_FPP_ESTADO ( cd_estado );

ALTER TABLE T_FPP_ENDERECO
    ADD CONSTRAINT FK_ENDERECO_BAIRRO FOREIGN KEY ( cd_bairro )
        REFERENCES T_FPP_bairro ( cd_bairro );

ALTER TABLE T_FPP_ENDERECO
    ADD CONSTRAINT FK_ENDERECO_TIPOEND FOREIGN KEY ( cd_tipo_logradouro )
        REFERENCES T_FPP_TIPO_ENDERECO ( cd_tipo_logradouro );

ALTER TABLE T_FPP_CATEGORIA
    ADD CONSTRAINT FK_CATEGORIA_USUARIO FOREIGN KEY ( cd_usuario )
        REFERENCES T_FPP_USUARIO ( cd_usuario );

ALTER TABLE T_FPP_DESPESA
    ADD CONSTRAINT FK_DESPESA_CATEGORIA FOREIGN KEY ( cd_categoria )
        REFERENCES T_FPP_CATEGORIA ( cd_categoria );

ALTER TABLE T_FPP_RECEITA
    ADD CONSTRAINT FK_RECEITA_CATEGORIA FOREIGN KEY ( cd_categoria )
        REFERENCES T_FPP_CATEGORIA ( cd_categoria );

ALTER TABLE T_FPP_RECEITA
    ADD CONSTRAINT FK_RECEITA_SUBCATEGORIA FOREIGN KEY ( cd_subcategoria )
        REFERENCES T_FPP_SUBCATEGORIA ( cd_subcategoria );

ALTER TABLE T_FPP_SUBCATEGORIA
    ADD CONSTRAINT FK_SUBCATEGORIA_CATEGORIA FOREIGN KEY ( cd_categoria )
        REFERENCES T_FPP_CATEGORIA ( cd_categoria );

ALTER TABLE T_FPP_DESPESA
    ADD CONSTRAINT FK_DESPESA_USUARIO FOREIGN KEY ( cd_usuario )
        REFERENCES T_FPP_USUARIO ( cd_usuario );

ALTER TABLE T_FPP_INVESTIMENTO
    ADD CONSTRAINT FK_INVESTIMENTO_TIPOINVES FOREIGN KEY ( cd_tipo )
        REFERENCES T_FPP_TIPO_INVESTIMENTO ( cd_tipo );

ALTER TABLE T_FPP_INVESTIMENTO
    ADD CONSTRAINT FK_INVESTIMENTO_USUARIO FOREIGN KEY ( cd_usuario )
        REFERENCES T_FPP_USUARIO ( cd_usuario );

ALTER TABLE T_FPP_RECEITA
    ADD CONSTRAINT FK_RECEITA_USUARIO FOREIGN KEY ( cd_usuario )
        REFERENCES T_FPP_USUARIO ( cd_usuario );

ALTER TABLE T_FPP_TELEFONE
    ADD CONSTRAINT FK_TELEFONE_USUARIO FOREIGN KEY ( cd_usuario )
        REFERENCES T_FPP_USUARIO ( cd_usuario );

ALTER TABLE T_FPP_USUARIO_ENDERECO
    ADD CONSTRAINT FK_USUARIO_ENDERECO FOREIGN KEY ( nr_endereco )
        REFERENCES T_FPP_ENDERECO ( cd_endereco );

ALTER TABLE T_FPP_USUARIO_ENDERECO
    ADD CONSTRAINT FK_USUARIOENDERECO_USUARIO FOREIGN KEY ( cd_usuario )
        REFERENCES T_FPP_USUARIO ( cd_usuario );


INSERT INTO T_FPP_USUARIO(CD_USUARIO, NM_NOME, DT_NASCIMENTO, DS_EMAIL, DS_SENHA) VALUES(1,'Felipe Gandra', TO_DATE('01/03/1984', 'DD/MM/YYYY'), 'fgandraf@gmail.com', '1234');
INSERT INTO T_FPP_USUARIO(CD_USUARIO, NM_NOME, DT_NASCIMENTO, DS_EMAIL, DS_SENHA) VALUES(2,'Henry Thuler', TO_DATE('01/01/1998', 'DD/MM/YYYY'), 'henry@email.com', 'abcd');

COMMIT