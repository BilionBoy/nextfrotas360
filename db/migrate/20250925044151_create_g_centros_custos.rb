# frozen_string_literal: true

class CreateGCentrosCustos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:g_centros_custos)
      create_table :g_centros_custos do |t|
        t.string :nome
        t.string :codigo_dotacao
        t.references :g_tipo_centro_custo, foreign_key: true
        t.references :a_unidade, foreign_key: true
        t.decimal :valor_inicial, precision: 15, scale: 2
        t.decimal :saldo_atual, precision: 15, scale: 2

        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :g_centros_custos if table_exists?(:g_centros_custos)
  end
end
