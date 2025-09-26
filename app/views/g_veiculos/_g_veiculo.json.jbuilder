json.extract! g_veiculo, :id, :placa, :chassi, :renavam, :modelo, :ano, :marca, :cor, :km_atual, :a_status_id, :g_tipo_veiculo_id, :a_unidade_id, :g_centro_custo_id, :created_at, :updated_at
json.url g_veiculo_url(g_veiculo, format: :json)
