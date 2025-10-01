# frozen_string_literal: true

class CreateFEmpresasServicos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:f_empresas_servicos)
      create_table :f_empresas_servicos do |t|
        t.references :f_empresa_fornecedora, null: false, foreign_key: true
        t.references :o_categoria_servico,   null: false, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :f_empresas_servicos if table_exists?(:f_empresas_servicos)
  end
end
