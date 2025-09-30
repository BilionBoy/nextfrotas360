# frozen_string_literal: true

class CreateTTaxasEmpresasFornecedoras < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:t_taxas_empresas_fornecedoras)
     create_table :t_taxas_empresas_fornecedoras do |t|
       t.references :t_taxa, null: false, foreign_key: true
       t.references :f_empresa_fornecedora, null: false, foreign_key: true
           
       t.string :created_by
       t.string :updated_by
       t.datetime :deleted_at
       t.timestamps
     end
    end
  end

  def down
    drop_table :t_taxas_empresas_fornecedoras if table_exists?(:t_taxas_empresas_fornecedoras)
  end
end
