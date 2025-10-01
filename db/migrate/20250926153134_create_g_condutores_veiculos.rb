# frozen_string_literal: true

class CreateGCondutoresVeiculos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:g_condutores_veiculos)
      create_table :g_condutores_veiculos do |t|
        t.references :g_condutor, null: false, foreign_key: true
        t.references :g_veiculo,  null: false, foreign_key: true
        t.date        :data_inicio
        t.string      :created_by
        t.string      :updated_by
        t.datetime    :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :g_condutores_veiculos if table_exists?(:g_condutores_veiculos)
  end
end
