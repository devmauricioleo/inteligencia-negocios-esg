CREATE OR REPLACE VIEW dw.vw_indicadores_powerbi AS

SELECT

    f.fato_key,

    t.data_completa,

    t.nome_mes,

    t.mes,

    t.trimestre,

    t.semestre,

    t.ano,

    u.codigo_unidade,

    u.nome_unidade,

    u.cidade,

    u.estado,

    u.regiao,

    i.codigo_indicador,

    i.nome_indicador,

    i.categoria,

    i.unidade_medida,

    i.sentido_melhoria,

    fo.nome_fonte,

    f.valor,

    f.meta_valor,

    f.custo_associado,

    f.observacao,

    f.data_carga

FROM dw.fato_indicadores f

INNER JOIN dw.dim_tempo t
    ON f.tempo_key = t.tempo_key

INNER JOIN dw.dim_unidade u
    ON f.unidade_key = u.unidade_key

INNER JOIN dw.dim_indicador i
    ON f.indicador_key = i.indicador_key

INNER JOIN dw.dim_fonte fo
    ON f.fonte_key = fo.fonte_key;

SELECT *
FROM dw.vw_indicadores_powerbi;