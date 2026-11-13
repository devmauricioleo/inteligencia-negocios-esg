CREATE TABLE dw.dim_tempo (

    tempo_key INTEGER PRIMARY KEY,

    data_completa DATE NOT NULL UNIQUE,

    dia INTEGER NOT NULL,

    mes INTEGER NOT NULL,

    nome_mes VARCHAR(20) NOT NULL,

    trimestre INTEGER NOT NULL,

    semestre INTEGER NOT NULL,

    ano INTEGER NOT NULL,

    dia_semana INTEGER NOT NULL,

    nome_dia_semana VARCHAR(20) NOT NULL

);