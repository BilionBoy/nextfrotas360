json.extract! g_condutor, :id, :nome, :email, :telefone, :cnh_numero, :g_categoria_carteira_condutor_id, :validace_cnh, :g_status_id, :g_carteira_orgao_emissor_id, :created_at, :updated_at
json.url g_condutor_url(g_condutor, format: :json)
