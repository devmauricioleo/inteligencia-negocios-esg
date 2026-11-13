CREATE OR REPLACE PROCEDURE dw.sp_estender_dim_tempo()
LANGUAGE plpgsql
AS $$
DECLARE
    v_max_data DATE;
    v_nova_data_fim DATE;
    v_data_corte DATE;
BEGIN
    -- 1. Descobre a maior data atualmente cadastrada na dim_tempo
    SELECT MAX(data) INTO v_max_data FROM dw.dim_tempo;
    
    -- Se a tabela estiver vazia por algum motivo, define um ponto de partida
    IF v_max_data IS NULL THEN
        v_max_data := '2020-01-01'::DATE;
    END IF;

    -- 2. Define a data de corte: Hoje + 2 anos
    v_data_corte := CURRENT_DATE + INTERVAL '2 years';

    -- 3. Verifica se a máxima data disponível é menor ou igual ao corte (faltam menos de 2 anos)
    IF v_max_data <= v_data_corte THEN
        -- Calcula a nova data final somando 10 anos a partir da máxima atual
        v_nova_data_fim := v_max_data + INTERVAL '10 years';
        
        -- 4. Insere os novos dias em lote usando generate_series do PostgreSQL
        INSERT INTO dw.dim_tempo (
            data, ano, mes, dia, nome_mes, dia_semana, trimestre, semestre, final_de_semana
        )
        SELECT 
            d::DATE AS data,
            EXTRACT(YEAR FROM d)::INT AS ano,
            EXTRACT(MONTH FROM d)::INT AS mes,
            EXTRACT(DAY FROM d)::INT AS dia,
            TO_CHAR(d, 'TMMonth') AS nome_mes,
            TO_CHAR(d, 'TMDay') AS dia_semana,
            EXTRACT(QUARTER FROM d)::INT AS trimestre,
            CASE WHEN EXTRACT(MONTH FROM d) <= 6 THEN 1 ELSE 2 END AS semestre,
            CASE WHEN EXTRACT(ISODOW FROM d) IN (6, 7) THEN TRUE ELSE FALSE END AS final_de_semana
        FROM generate_series(v_max_data + INTERVAL '1 day', v_nova_data_fim, '1 day'::interval) d
        ON CONFLICT (data) DO NOTHING; -- Garante que se rodar duplicado, não dá erro de chave primária
        
        RAISE NOTICE 'Sucesso: dim_tempo foi estendida até o dia %.', v_nova_data_fim;
    ELSE
        RAISE NOTICE 'Aviso: A tabela ainda possui cobertura segura até %. Nenhuma ação necessária.', v_max_data;
    END IF;
END;
$$;