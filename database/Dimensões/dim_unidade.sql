CREATE TABLE dw.dim_unidade (

    unidade_key INTEGER GENERATED ALWAYS AS IDENTITY
        PRIMARY KEY,

    codigo_unidade VARCHAR(20) NOT NULL UNIQUE,

    nome_unidade VARCHAR(100) NOT NULL,

    cidade VARCHAR(100) NOT NULL,

    estado CHAR(2) NOT NULL,

    regiao VARCHAR(30) NOT NULL,

    ativo BOOLEAN DEFAULT TRUE

);