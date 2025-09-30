# frozen_string_literal: true

class CreateFEmpresasFornecedoras < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:f_empresas_fornecedoras)
      create_table :f_empresas_fornecedoras do |t|
        t.string :nome_fantasia
        t.string :razao_social
        t.string :cnjp
        t.string :endereco
        t.string :telefone
        t.string :contato
        t.string :email
        t.references :a_status,    null: false, foreign_key: true
        t.references :g_municipio, null: false, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :f_empresas_fornecedoras if table_exists?(:f_empresas_fornecedoras)
  end
end
