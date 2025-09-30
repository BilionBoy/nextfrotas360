json.extract! o_solicitacao, :id, :numero, :solicitante_id, :g_veiculo_id, :g_centro_custo_id, :o_tipo_solicitacao_id, :o_categoria_servico_id, :descricao, :km_reportado, :o_urgencia_id, :data_limite_publicacao, :o_status_id, :publicado_por_id, :publicado_em, :saldo_snapshot, :created_at, :updated_at
json.url o_solicitacao_url(o_solicitacao, format: :json)
