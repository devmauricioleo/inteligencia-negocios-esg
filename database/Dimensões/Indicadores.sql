INSERT INTO dw.dim_indicador (

    codigo_indicador,
    nome_indicador,
    categoria,
    descricao,
    unidade_medida,
    sentido_melhoria

)
VALUES

(
    'AMB001',
    'Consumo de agua',
    'Ambiental',
    'Quantidade de agua consumida pela unidade',
    'm3',
    'MENOR'
),

(
    'AMB002',
    'Consumo de energia',
    'Ambiental',
    'Quantidade de energia eletrica consumida',
    'kWh',
    'MENOR'
),

(
    'AMB003',
    'Emissao de CO2',
    'Ambiental',
    'Quantidade de gases de efeito estufa emitidos',
    'toneladas',
    'MENOR'
),

(
    'AMB004',
    'Residuos reciclados',
    'Ambiental',
    'Quantidade de residuos destinados a reciclagem',
    'kg',
    'MAIOR'
),

(
    'SOC001',
    'Horas de treinamento',
    'Social',
    'Total de horas de treinamento dos colaboradores',
    'horas',
    'MAIOR'
),

(
    'SOC002',
    'Acidentes de trabalho',
    'Social',
    'Quantidade de acidentes registrados',
    'ocorrencias',
    'MENOR'
),

(
    'ECO001',
    'Custos operacionais',
    'Economico',
    'Total de custos operacionais da unidade',
    'R$',
    'MENOR'
),

(
    'GOV001',
    'Nao conformidades',
    'Governanca',
    'Quantidade de nao conformidades identificadas',
    'ocorrencias',
    'MENOR'
);