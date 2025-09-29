json.extract! f_financeiro, :id, :f_empresa_fornecedora_id, :o_categoria_servico_id, :saldo_total, :saldo_disponivel, :saldo_reservado, :created_at, :updated_at
json.url f_financeiro_url(f_financeiro, format: :json)
