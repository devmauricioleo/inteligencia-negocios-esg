SELECT

    nome_unidade,

    nome_indicador,

    valor,

    meta_valor,

    CASE

        WHEN valor <= meta_valor
        THEN 'Meta atingida'

        ELSE 'Meta nao atingida'

    END AS situacao_meta

FROM dw.vw_indicadores_powerbi

WHERE

    nome_indicador = 'Consumo de agua'

    AND ano = 2025

    AND mes = 1

ORDER BY valor DESC;