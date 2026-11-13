CREATE INDEX idx_fato_tempo
ON dw.fato_indicadores(tempo_key);

CREATE INDEX idx_fato_unidade
ON dw.fato_indicadores(unidade_key);

CREATE INDEX idx_fato_indicador
ON dw.fato_indicadores(indicador_key);

CREATE INDEX idx_fato_fonte
ON dw.fato_indicadores(fonte_key);