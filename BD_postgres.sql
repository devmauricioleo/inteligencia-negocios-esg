-- Verificar as unidades
SELECT * FROM dw.dim_unidade;

-- Verificar os indicadores
SELECT * FROM dw.dim_indicador;

-- Verificar as fontes
SELECT * FROM dw.dim_fonte;

-- Verificar os dados da tabela fato
SELECT * FROM dw.fato_indicadores;

-- Verificar a visualização completa
SELECT * FROM dw.vw_indicadores_powerbi;