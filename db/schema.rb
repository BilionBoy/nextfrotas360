# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_10_04_201901) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "a_cargos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.integer "nivel"
    t.bigint "a_status_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["a_status_id"], name: "index_a_cargos_on_a_status_id"
  end

  create_table "a_papeis", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.bigint "a_status_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["a_status_id"], name: "index_a_papeis_on_a_status_id"
  end

  create_table "a_papeis_permissoes", force: :cascade do |t|
    t.bigint "a_papel_id"
    t.bigint "a_permissao_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["a_papel_id"], name: "index_a_papeis_permissoes_on_a_papel_id"
    t.index ["a_permissao_id"], name: "index_a_papeis_permissoes_on_a_permissao_id"
  end

  create_table "a_permissoes", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.string "recurso"
    t.string "acao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "a_status", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "a_tipo_usuarios", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "a_tipos_unidades", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "a_unidades", force: :cascade do |t|
    t.string "nome_fantasia"
    t.bigint "a_tipo_unidade_id", null: false
    t.string "cnpj"
    t.string "endereco"
    t.string "telefone"
    t.bigint "a_status_id"
    t.string "codigo_interno"
    t.bigint "g_municipio_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["a_status_id"], name: "index_a_unidades_on_a_status_id"
    t.index ["a_tipo_unidade_id"], name: "index_a_unidades_on_a_tipo_unidade_id"
    t.index ["g_municipio_id"], name: "index_a_unidades_on_g_municipio_id"
  end

  create_table "a_usuarios_historicos_cargos_unidades", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "a_cargo_id", null: false
    t.bigint "a_unidade_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["a_cargo_id"], name: "index_a_usuarios_historicos_cargos_unidades_on_a_cargo_id"
    t.index ["a_unidade_id"], name: "index_a_usuarios_historicos_cargos_unidades_on_a_unidade_id"
    t.index ["user_id"], name: "index_a_usuarios_historicos_cargos_unidades_on_user_id"
  end

  create_table "a_usuarios_papeis", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "a_papel_id", null: false
    t.bigint "a_unidade_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["a_papel_id"], name: "index_a_usuarios_papeis_on_a_papel_id"
    t.index ["a_unidade_id"], name: "index_a_usuarios_papeis_on_a_unidade_id"
    t.index ["user_id"], name: "index_a_usuarios_papeis_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "f_empresas_fornecedoras", force: :cascade do |t|
    t.string "nome_fantasia"
    t.string "razao_social"
    t.string "cnjp"
    t.string "endereco"
    t.string "telefone"
    t.string "contato"
    t.string "email"
    t.bigint "a_status_id", null: false
    t.bigint "g_municipio_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["a_status_id"], name: "index_f_empresas_fornecedoras_on_a_status_id"
    t.index ["g_municipio_id"], name: "index_f_empresas_fornecedoras_on_g_municipio_id"
  end

  create_table "f_empresas_servicos", force: :cascade do |t|
    t.bigint "f_empresa_fornecedora_id", null: false
    t.bigint "o_categoria_servico_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["f_empresa_fornecedora_id"], name: "index_f_empresas_servicos_on_f_empresa_fornecedora_id"
    t.index ["o_categoria_servico_id"], name: "index_f_empresas_servicos_on_o_categoria_servico_id"
  end

  create_table "f_financeiros", force: :cascade do |t|
    t.bigint "f_empresa_fornecedora_id", null: false
    t.bigint "o_categoria_servico_id", null: false
    t.decimal "saldo_total", precision: 15, scale: 2, default: "0.0", null: false
    t.decimal "saldo_disponivel", precision: 15, scale: 2, default: "0.0", null: false
    t.decimal "saldo_reservado", precision: 15, scale: 2, default: "0.0", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["f_empresa_fornecedora_id"], name: "index_f_financeiros_on_f_empresa_fornecedora_id"
    t.index ["o_categoria_servico_id"], name: "index_f_financeiros_on_o_categoria_servico_id"
  end

  create_table "f_financeiros_movimentos", force: :cascade do |t|
    t.string "descricao"
    t.bigint "f_financeiro_id", null: false
    t.bigint "g_tipo_movimento_id", null: false
    t.decimal "valor", precision: 15, scale: 2, default: "0.0", null: false
    t.string "observacao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["f_financeiro_id"], name: "index_f_financeiros_movimentos_on_f_financeiro_id"
    t.index ["g_tipo_movimento_id"], name: "index_f_financeiros_movimentos_on_g_tipo_movimento_id"
  end

  create_table "g_bairros", force: :cascade do |t|
    t.string "descricao"
    t.bigint "g_municipio_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_municipio_id"], name: "index_g_bairros_on_g_municipio_id"
  end

  create_table "g_carteiras_orgaos_emissores", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_categorias_carteiras_condutores", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_centros_custos", force: :cascade do |t|
    t.string "nome"
    t.string "codigo_dotacao"
    t.bigint "g_tipo_centro_custo_id"
    t.bigint "a_unidade_id"
    t.decimal "valor_inicial", precision: 15, scale: 2
    t.decimal "saldo_atual", precision: 15, scale: 2
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["a_unidade_id"], name: "index_g_centros_custos_on_a_unidade_id"
    t.index ["g_tipo_centro_custo_id"], name: "index_g_centros_custos_on_g_tipo_centro_custo_id"
  end

  create_table "g_centros_custos_movimentos", force: :cascade do |t|
    t.bigint "g_centro_custo_id", null: false
    t.bigint "g_tipo_movimento_id", null: false
    t.decimal "valor", precision: 15, scale: 2
    t.string "referencia_tipo"
    t.bigint "referencia_id"
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_centro_custo_id"], name: "index_g_centros_custos_movimentos_on_g_centro_custo_id"
    t.index ["g_tipo_movimento_id"], name: "index_g_centros_custos_movimentos_on_g_tipo_movimento_id"
  end

  create_table "g_condutores", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.string "cnh_numero"
    t.datetime "validade_cnh"
    t.bigint "g_categoria_carteira_condutor_id", null: false
    t.bigint "g_status_id", null: false
    t.bigint "g_carteira_orgao_emissor_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_carteira_orgao_emissor_id"], name: "index_g_condutores_on_g_carteira_orgao_emissor_id"
    t.index ["g_categoria_carteira_condutor_id"], name: "index_g_condutores_on_g_categoria_carteira_condutor_id"
    t.index ["g_status_id"], name: "index_g_condutores_on_g_status_id"
  end

  create_table "g_condutores_veiculos", force: :cascade do |t|
    t.bigint "g_condutor_id", null: false
    t.bigint "g_veiculo_id", null: false
    t.date "data_inicio"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_condutor_id"], name: "index_g_condutores_veiculos_on_g_condutor_id"
    t.index ["g_veiculo_id"], name: "index_g_condutores_veiculos_on_g_veiculo_id"
  end

  create_table "g_distritos", force: :cascade do |t|
    t.string "descricao"
    t.integer "codigo_ibge"
    t.bigint "g_municipio_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_municipio_id"], name: "index_g_distritos_on_g_municipio_id"
  end

  create_table "g_estados", force: :cascade do |t|
    t.string "descricao"
    t.string "uf"
    t.bigint "g_pais_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_pais_id"], name: "index_g_estados_on_g_pais_id"
  end

  create_table "g_localidades", force: :cascade do |t|
    t.string "descricao"
    t.bigint "g_distrito_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_distrito_id"], name: "index_g_localidades_on_g_distrito_id"
  end

  create_table "g_municipios", force: :cascade do |t|
    t.integer "codigo_ibge"
    t.string "descricao"
    t.bigint "g_estado_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_estado_id"], name: "index_g_municipios_on_g_estado_id"
  end

  create_table "g_paises", force: :cascade do |t|
    t.string "descricao"
    t.string "sigla"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_status", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_tipos_centros_custos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_tipos_movimentos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_tipos_veiculos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_veiculos", force: :cascade do |t|
    t.string "placa"
    t.string "chassi"
    t.string "renavam"
    t.string "modelo"
    t.integer "ano"
    t.string "marca"
    t.string "cor"
    t.string "km_atual"
    t.bigint "a_status_id", null: false
    t.bigint "g_tipo_veiculo_id", null: false
    t.bigint "a_unidade_id", null: false
    t.bigint "g_centro_custo_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["a_status_id"], name: "index_g_veiculos_on_a_status_id"
    t.index ["a_unidade_id"], name: "index_g_veiculos_on_a_unidade_id"
    t.index ["g_centro_custo_id"], name: "index_g_veiculos_on_g_centro_custo_id"
    t.index ["g_tipo_veiculo_id"], name: "index_g_veiculos_on_g_tipo_veiculo_id"
  end

  create_table "o_categorias_servicos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "o_cotacoes", force: :cascade do |t|
    t.bigint "o_solicitacao_id", null: false
    t.bigint "o_visibilidade_id", null: false
    t.bigint "o_status_id", null: false
    t.datetime "data_expiracao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["o_solicitacao_id"], name: "index_o_cotacoes_on_o_solicitacao_id"
    t.index ["o_status_id"], name: "index_o_cotacoes_on_o_status_id"
    t.index ["o_visibilidade_id"], name: "index_o_cotacoes_on_o_visibilidade_id"
  end

  create_table "o_cotacoes_itens", force: :cascade do |t|
    t.string "descricao"
    t.bigint "o_cotacao_id", null: false
    t.bigint "o_categoria_servico_id", null: false
    t.integer "quantidade"
    t.decimal "valor_unitario", precision: 10, scale: 2
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["o_categoria_servico_id"], name: "index_o_cotacoes_itens_on_o_categoria_servico_id"
    t.index ["o_cotacao_id"], name: "index_o_cotacoes_itens_on_o_cotacao_id"
  end

  create_table "o_ordem_servicos", force: :cascade do |t|
    t.string "numero_os", null: false
    t.bigint "o_proposta_id", null: false
    t.bigint "f_empresa_fornecedora_id", null: false
    t.bigint "g_veiculo_id", null: false
    t.bigint "o_status_id", null: false
    t.bigint "validado_por_id"
    t.json "itens_previstos", default: []
    t.json "itens_executados", default: []
    t.datetime "data_inicio_prevista"
    t.datetime "data_termino_prevista"
    t.datetime "data_inicio_real"
    t.datetime "data_termino_real"
    t.decimal "custo_real", precision: 15, scale: 2, default: "0.0"
    t.text "observacoes"
    t.datetime "validado_em"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_o_ordem_servicos_on_deleted_at"
    t.index ["f_empresa_fornecedora_id"], name: "index_o_ordem_servicos_on_f_empresa_fornecedora_id"
    t.index ["g_veiculo_id"], name: "index_o_ordem_servicos_on_g_veiculo_id"
    t.index ["numero_os"], name: "index_o_ordem_servicos_on_numero_os", unique: true
    t.index ["o_proposta_id"], name: "index_o_ordem_servicos_on_o_proposta_id"
    t.index ["o_status_id"], name: "index_o_ordem_servicos_on_o_status_id"
    t.index ["validado_por_id"], name: "index_o_ordem_servicos_on_validado_por_id"
  end

  create_table "o_propostas", force: :cascade do |t|
    t.bigint "o_cotacao_id", null: false
    t.bigint "f_empresa_fornecedora_id", null: false
    t.bigint "usuario_envio_id", null: false
    t.bigint "o_status_id", null: false
    t.decimal "valor_total", precision: 15, scale: 2
    t.integer "prazo_execucao_dias"
    t.datetime "validade_proposta"
    t.integer "versao", default: 1
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["f_empresa_fornecedora_id"], name: "index_o_propostas_on_f_empresa_fornecedora_id"
    t.index ["o_cotacao_id"], name: "index_o_propostas_on_o_cotacao_id"
    t.index ["o_status_id"], name: "index_o_propostas_on_o_status_id"
    t.index ["usuario_envio_id"], name: "index_o_propostas_on_usuario_envio_id"
  end

  create_table "o_propostas_itens", force: :cascade do |t|
    t.bigint "o_proposta_id", null: false
    t.bigint "o_cotacao_item_id", null: false
    t.decimal "quantidade", precision: 10, scale: 2, null: false
    t.decimal "valor_unitario", precision: 15, scale: 2, null: false
    t.decimal "total_item", precision: 15, scale: 2, null: false
    t.string "observacao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["o_cotacao_item_id"], name: "index_o_propostas_itens_on_o_cotacao_item_id"
    t.index ["o_proposta_id"], name: "index_o_propostas_itens_on_o_proposta_id"
  end

  create_table "o_solicitacoes", force: :cascade do |t|
    t.integer "numero", null: false
    t.string "descricao"
    t.integer "km_reportado"
    t.datetime "data_limite_publicacao"
    t.datetime "publicado_em"
    t.decimal "saldo_snapshot", precision: 15, scale: 2
    t.bigint "solicitante_id", null: false
    t.bigint "publicado_por_id"
    t.bigint "g_veiculo_id", null: false
    t.bigint "g_centro_custo_id", null: false
    t.bigint "o_tipo_solicitacao_id", null: false
    t.bigint "o_categoria_servico_id", null: false
    t.bigint "o_status_id", null: false
    t.bigint "o_urgencia_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "observacao"
    t.index ["g_centro_custo_id"], name: "index_o_solicitacoes_on_g_centro_custo_id"
    t.index ["g_veiculo_id"], name: "index_o_solicitacoes_on_g_veiculo_id"
    t.index ["o_categoria_servico_id"], name: "index_o_solicitacoes_on_o_categoria_servico_id"
    t.index ["o_status_id"], name: "index_o_solicitacoes_on_o_status_id"
    t.index ["o_tipo_solicitacao_id"], name: "index_o_solicitacoes_on_o_tipo_solicitacao_id"
    t.index ["o_urgencia_id"], name: "index_o_solicitacoes_on_o_urgencia_id"
    t.index ["publicado_por_id"], name: "index_o_solicitacoes_on_publicado_por_id"
    t.index ["solicitante_id"], name: "index_o_solicitacoes_on_solicitante_id"
  end

  create_table "o_status", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "o_tipos_solicitacoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "o_urgencias", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "o_visibilidades", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "t_taxas", force: :cascade do |t|
    t.string "nome", null: false
    t.string "descricao"
    t.decimal "percentual", precision: 5, scale: 2
    t.bigint "a_status_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["a_status_id"], name: "index_t_taxas_on_a_status_id"
  end

  create_table "t_taxas_empresas_fornecedoras", force: :cascade do |t|
    t.bigint "t_taxa_id", null: false
    t.bigint "f_empresa_fornecedora_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["f_empresa_fornecedora_id"], name: "idx_on_f_empresa_fornecedora_id_0c789feaac"
    t.index ["t_taxa_id"], name: "index_t_taxas_empresas_fornecedoras_on_t_taxa_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nome"
    t.string "telefone"
    t.string "cpf"
    t.bigint "a_cargo_id", null: false
    t.bigint "a_unidade_id"
    t.bigint "a_tipo_usuario_id", null: false
    t.bigint "a_status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "f_empresa_fornecedora_id"
    t.string "created_by"
    t.index ["a_cargo_id"], name: "index_users_on_a_cargo_id"
    t.index ["a_status_id"], name: "index_users_on_a_status_id"
    t.index ["a_tipo_usuario_id"], name: "index_users_on_a_tipo_usuario_id"
    t.index ["a_unidade_id"], name: "index_users_on_a_unidade_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["f_empresa_fornecedora_id"], name: "index_users_on_f_empresa_fornecedora_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "a_cargos", "a_status"
  add_foreign_key "a_papeis", "a_status"
  add_foreign_key "a_papeis_permissoes", "a_permissoes"
  add_foreign_key "a_unidades", "a_tipos_unidades"
  add_foreign_key "a_usuarios_historicos_cargos_unidades", "a_cargos"
  add_foreign_key "a_usuarios_historicos_cargos_unidades", "a_unidades"
  add_foreign_key "a_usuarios_historicos_cargos_unidades", "users"
  add_foreign_key "a_usuarios_papeis", "a_papeis"
  add_foreign_key "a_usuarios_papeis", "a_unidades"
  add_foreign_key "a_usuarios_papeis", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "f_empresas_fornecedoras", "a_status"
  add_foreign_key "f_empresas_fornecedoras", "g_municipios"
  add_foreign_key "f_empresas_servicos", "f_empresas_fornecedoras"
  add_foreign_key "f_empresas_servicos", "o_categorias_servicos"
  add_foreign_key "f_financeiros", "f_empresas_fornecedoras"
  add_foreign_key "f_financeiros", "o_categorias_servicos"
  add_foreign_key "f_financeiros_movimentos", "f_financeiros"
  add_foreign_key "f_financeiros_movimentos", "g_tipos_movimentos"
  add_foreign_key "g_bairros", "g_municipios"
  add_foreign_key "g_centros_custos", "a_unidades"
  add_foreign_key "g_centros_custos", "g_tipos_centros_custos"
  add_foreign_key "g_centros_custos_movimentos", "g_centros_custos"
  add_foreign_key "g_centros_custos_movimentos", "g_tipos_movimentos"
  add_foreign_key "g_condutores", "g_carteiras_orgaos_emissores"
  add_foreign_key "g_condutores", "g_categorias_carteiras_condutores"
  add_foreign_key "g_condutores", "g_status"
  add_foreign_key "g_condutores_veiculos", "g_condutores"
  add_foreign_key "g_condutores_veiculos", "g_veiculos"
  add_foreign_key "g_distritos", "g_municipios"
  add_foreign_key "g_estados", "g_paises"
  add_foreign_key "g_localidades", "g_distritos"
  add_foreign_key "g_municipios", "g_estados"
  add_foreign_key "g_veiculos", "a_status"
  add_foreign_key "g_veiculos", "a_unidades"
  add_foreign_key "g_veiculos", "g_centros_custos"
  add_foreign_key "g_veiculos", "g_tipos_veiculos"
  add_foreign_key "o_cotacoes", "o_solicitacoes"
  add_foreign_key "o_cotacoes", "o_status"
  add_foreign_key "o_cotacoes", "o_visibilidades"
  add_foreign_key "o_cotacoes_itens", "o_categorias_servicos"
  add_foreign_key "o_cotacoes_itens", "o_cotacoes"
  add_foreign_key "o_ordem_servicos", "f_empresas_fornecedoras"
  add_foreign_key "o_ordem_servicos", "g_veiculos"
  add_foreign_key "o_ordem_servicos", "o_propostas"
  add_foreign_key "o_ordem_servicos", "o_status"
  add_foreign_key "o_ordem_servicos", "users", column: "validado_por_id"
  add_foreign_key "o_propostas", "f_empresas_fornecedoras"
  add_foreign_key "o_propostas", "o_cotacoes"
  add_foreign_key "o_propostas", "o_status"
  add_foreign_key "o_propostas", "users", column: "usuario_envio_id"
  add_foreign_key "o_propostas_itens", "o_cotacoes_itens"
  add_foreign_key "o_propostas_itens", "o_propostas"
  add_foreign_key "o_solicitacoes", "g_centros_custos"
  add_foreign_key "o_solicitacoes", "g_veiculos"
  add_foreign_key "o_solicitacoes", "o_categorias_servicos"
  add_foreign_key "o_solicitacoes", "o_status"
  add_foreign_key "o_solicitacoes", "o_tipos_solicitacoes"
  add_foreign_key "o_solicitacoes", "o_urgencias"
  add_foreign_key "o_solicitacoes", "users", column: "publicado_por_id"
  add_foreign_key "o_solicitacoes", "users", column: "solicitante_id"
  add_foreign_key "t_taxas", "a_status"
  add_foreign_key "t_taxas_empresas_fornecedoras", "f_empresas_fornecedoras"
  add_foreign_key "t_taxas_empresas_fornecedoras", "t_taxas"
  add_foreign_key "users", "a_cargos"
  add_foreign_key "users", "a_status"
  add_foreign_key "users", "a_tipo_usuarios"
  add_foreign_key "users", "a_unidades"
  add_foreign_key "users", "f_empresas_fornecedoras"
end
