INSERT INTO dw.dim_tempo (

    tempo_key,
    data_completa,
    dia,
    mes,
    nome_mes,
    trimestre,
    semestre,
    ano,
    dia_semana,
    nome_dia_semana

)

SELECT

    TO_CHAR(d, 'YYYYMMDD')::INTEGER,

    d,

    EXTRACT(DAY FROM d)::INTEGER,

    EXTRACT(MONTH FROM d)::INTEGER,

    CASE EXTRACT(MONTH FROM d)::INTEGER
        WHEN 1 THEN 'Janeiro'
        WHEN 2 THEN 'Fevereiro'
        WHEN 3 THEN 'Marco'
        WHEN 4 THEN 'Abril'
        WHEN 5 THEN 'Maio'
        WHEN 6 THEN 'Junho'
        WHEN 7 THEN 'Julho'
        WHEN 8 THEN 'Agosto'
        WHEN 9 THEN 'Setembro'
        WHEN 10 THEN 'Outubro'
        WHEN 11 THEN 'Novembro'
        WHEN 12 THEN 'Dezembro'
    END,

    EXTRACT(QUARTER FROM d)::INTEGER,

    CASE
        WHEN EXTRACT(MONTH FROM d) <= 6 THEN 1
        ELSE 2
    END,

    EXTRACT(YEAR FROM d)::INTEGER,

    EXTRACT(ISODOW FROM d)::INTEGER,

    CASE EXTRACT(ISODOW FROM d)::INTEGER
        WHEN 1 THEN 'Segunda-feira'
        WHEN 2 THEN 'Terca-feira'
        WHEN 3 THEN 'Quarta-feira'
        WHEN 4 THEN 'Quinta-feira'
        WHEN 5 THEN 'Sexta-feira'
        WHEN 6 THEN 'Sabado'
        WHEN 7 THEN 'Domingo'
    END

FROM GENERATE_SERIES(
    DATE '2020-01-01',
    DATE '2035-12-31',
    INTERVAL '1 day'
) AS d;