SELECT

    nome_unidade,

    nome_indicador,

    valor,

    meta_valor,

    (valor - meta_valor) AS diferenca_meta

FROM dw.vw_indicadores_powerbi

WHERE meta_valor IS NOT NULL;