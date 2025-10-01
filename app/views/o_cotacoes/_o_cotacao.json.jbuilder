json.extract! o_cotacao, :id, :o_solicitacao_id, :o_visibilidade_id, :o_status_id, :data_expiracao, :created_at, :updated_at
json.url o_cotacao_url(o_cotacao, format: :json)
