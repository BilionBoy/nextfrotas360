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

ActiveRecord::Schema[7.2].define(version: 2025_09_26_051643) do
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
    t.bigint "a_unidade_id", null: false
    t.bigint "a_tipo_usuario_id", null: false
    t.bigint "a_status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["a_cargo_id"], name: "index_users_on_a_cargo_id"
    t.index ["a_status_id"], name: "index_users_on_a_status_id"
    t.index ["a_tipo_usuario_id"], name: "index_users_on_a_tipo_usuario_id"
    t.index ["a_unidade_id"], name: "index_users_on_a_unidade_id"
    t.index ["email"], name: "index_users_on_email", unique: true
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
  add_foreign_key "g_bairros", "g_municipios"
  add_foreign_key "g_centros_custos", "a_unidades"
  add_foreign_key "g_centros_custos", "g_tipos_centros_custos"
  add_foreign_key "g_centros_custos_movimentos", "g_centros_custos"
  add_foreign_key "g_centros_custos_movimentos", "g_tipos_movimentos"
  add_foreign_key "g_condutores", "g_carteiras_orgaos_emissores"
  add_foreign_key "g_condutores", "g_categorias_carteiras_condutores"
  add_foreign_key "g_condutores", "g_status"
  add_foreign_key "g_distritos", "g_municipios"
  add_foreign_key "g_estados", "g_paises"
  add_foreign_key "g_localidades", "g_distritos"
  add_foreign_key "g_municipios", "g_estados"
  add_foreign_key "g_veiculos", "a_status"
  add_foreign_key "g_veiculos", "a_unidades"
  add_foreign_key "g_veiculos", "g_centros_custos"
  add_foreign_key "g_veiculos", "g_tipos_veiculos"
  add_foreign_key "t_taxas", "a_status"
  add_foreign_key "users", "a_cargos"
  add_foreign_key "users", "a_status"
  add_foreign_key "users", "a_tipo_usuarios"
  add_foreign_key "users", "a_unidades"
end
