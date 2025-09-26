# frozen_string_literal: true

class CreateGCentrosCustosMovimentos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:g_centros_custos_movimentos)
      create_table :g_centros_custos_movimentos do |t|
        t.references :g_centro_custo, null: false, foreign_key: true
        t.references :g_tipo_movimento, null: false, foreign_key: true
        t.decimal :valor, precision: 15, scale: 2
        t.string :referencia_tipo
        t.bigint :referencia_id
        t.string :descricao
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :g_centros_custos_movimentos, if_exists: true
  end
end
