json.extract! o_proposta, :id, :o_cotacao_id, :empresa_fornecedora_id, :usuario_envio_id, :valor_total, :prazo_execucao_dias, :validade_proposta, :o_status_id, :versao, :created_at, :updated_at
json.url o_proposta_url(o_proposta, format: :json)
