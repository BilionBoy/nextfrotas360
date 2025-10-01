# frozen_string_literal: true

class CreateGMunicipios < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:g_municipios)
      create_table :g_municipios do |t|
        t.integer :codigo_ibge
        t.string :descricao
        t.references :g_estado, null: false, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :g_municipios if table_exists?(:g_municipios)
  end
end
