json.extract! f_financeiro_movimento, :id, :descricao, :f_financeiro_id, :g_tipo_movimento_id, :valor, :observacao, :created_at, :updated_at
json.url f_financeiro_movimento_url(f_financeiro_movimento, format: :json)
