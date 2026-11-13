CREATE TABLE dw.dim_fonte (

    fonte_key INTEGER GENERATED ALWAYS AS IDENTITY
        PRIMARY KEY,

    nome_fonte VARCHAR(100) NOT NULL,

    tipo_fonte VARCHAR(50) NOT NULL,

    descricao TEXT,

    responsavel VARCHAR(100),

    ativo BOOLEAN DEFAULT TRUE

);