CREATE TABLE dw.fato_indicadores (

    fato_key BIGINT GENERATED ALWAYS AS IDENTITY
        PRIMARY KEY,

    tempo_key INTEGER NOT NULL,

    unidade_key INTEGER NOT NULL,

    indicador_key INTEGER NOT NULL,

    fonte_key INTEGER NOT NULL,

    valor NUMERIC(18,4) NOT NULL,

    meta_valor NUMERIC(18,4),

    custo_associado NUMERIC(18,2),

    observacao TEXT,

    data_carga TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_fato_tempo
        FOREIGN KEY (tempo_key)
        REFERENCES dw.dim_tempo(tempo_key),

    CONSTRAINT fk_fato_unidade
        FOREIGN KEY (unidade_key)
        REFERENCES dw.dim_unidade(unidade_key),

    CONSTRAINT fk_fato_indicador
        FOREIGN KEY (indicador_key)
        REFERENCES dw.dim_indicador(indicador_key),

    CONSTRAINT fk_fato_fonte
        FOREIGN KEY (fonte_key)
        REFERENCES dw.dim_fonte(fonte_key),

    CONSTRAINT uq_fato_indicador
        UNIQUE (tempo_key, unidade_key, indicador_key)

);