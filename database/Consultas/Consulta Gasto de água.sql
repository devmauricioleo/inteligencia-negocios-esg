SELECT

    nome_unidade,

    SUM(valor) AS consumo_total,

    unidade_medida

FROM dw.vw_indicadores_powerbi

WHERE nome_indicador = 'Consumo de agua'

GROUP BY
    nome_unidade,
    unidade_medida

ORDER BY consumo_total DESC;