CREATE TABLE dw.dim_indicador (

    indicador_key INTEGER GENERATED ALWAYS AS IDENTITY
        PRIMARY KEY,

    codigo_indicador VARCHAR(30) NOT NULL UNIQUE,

    nome_indicador VARCHAR(100) NOT NULL,

    categoria VARCHAR(30) NOT NULL,

    descricao TEXT,

    unidade_medida VARCHAR(30) NOT NULL,

    sentido_melhoria VARCHAR(10) NOT NULL,

    ativo BOOLEAN DEFAULT TRUE,

    CONSTRAINT chk_categoria
        CHECK (
            categoria IN (
                'Ambiental',
                'Social',
                'Economico',
                'Governanca'
            )
        ),

    CONSTRAINT chk_sentido
        CHECK (
            sentido_melhoria IN (
                'MENOR',
                'MAIOR'
            )
        )

);