json.extract! t_taxa, :id, :nome, :descricao, :percentual, :a_status_id, :created_at, :updated_at
json.url t_taxa_url(t_taxa, format: :json)
