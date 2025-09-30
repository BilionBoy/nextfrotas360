# frozen_string_literal: true

class CreateGTiposCentrosCustos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:g_tipos_centros_custos)
      create_table :g_tipos_centros_custos do |t|
        t.string :descricao
            
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :g_tipos_centros_custos if table_exists?(:g_tipos_centros_custos)
  end
end
