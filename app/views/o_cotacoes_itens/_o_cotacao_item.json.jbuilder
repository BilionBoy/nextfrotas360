json.extract! o_cotacao_item, :id, :descricao, :o_cotacao_id, :o_categoria_servico_id, :quantidade, :valor_unitario, :created_at, :updated_at
json.url o_cotacao_item_url(o_cotacao_item, format: :json)
