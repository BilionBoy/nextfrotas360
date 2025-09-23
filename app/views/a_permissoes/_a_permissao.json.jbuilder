json.extract! a_permissao, :id, :nome, :descricao, :recurso, :acao, :created_at, :updated_at
json.url a_permissao_url(a_permissao, format: :json)
