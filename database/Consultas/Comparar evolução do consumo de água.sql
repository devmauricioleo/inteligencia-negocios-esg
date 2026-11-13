SELECT

    ano,

    nome_unidade,

    SUM(valor) AS consumo_anual

FROM dw.vw_indicadores_powerbi

WHERE

    nome_indicador = 'Consumo de agua'

GROUP BY

    ano,

    nome_unidade

ORDER BY

    ano,

    nome_unidade;