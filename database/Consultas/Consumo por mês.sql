SELECT

    ano,

    mes,

    nome_mes,

    nome_unidade,

    valor AS consumo_mensal

FROM dw.vw_indicadores_powerbi

WHERE

    nome_indicador = 'Consumo de agua'

ORDER BY

    ano,

    mes,

    nome_unidade;