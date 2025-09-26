json.extract! f_empresa_fornecedora, :id, :nome_fantasia, :razao_social, :cnjp, :endereco, :telefone, :contato, :email, :a_status_id, :g_municipio_id, :created_at, :updated_at
json.url f_empresa_fornecedora_url(f_empresa_fornecedora, format: :json)
