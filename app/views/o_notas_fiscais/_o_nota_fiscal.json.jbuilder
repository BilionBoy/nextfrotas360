json.extract! o_nota_fiscal, :id, :o_ordem_servico_id, :numero, :data_emissao, :valor_total, :o_status_nf_id, :created_at, :updated_at
json.url o_nota_fiscal_url(o_nota_fiscal, format: :json)
