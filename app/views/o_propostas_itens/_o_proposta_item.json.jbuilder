json.extract! o_proposta_item, :id, :o_cotacao_id, :o_cotacao_item_id, :quantidade, :valor_unitario, :total_item, :observacao, :created_at, :updated_at
json.url o_proposta_item_url(o_proposta_item, format: :json)
