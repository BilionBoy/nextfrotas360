# frozen_string_literal: true

class CreateGVeiculos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:g_veiculos)
      create_table :g_veiculos do |t|
        t.string :placa
        t.string :chassi
        t.string :renavam
        t.string :modelo
        t.integer :ano
        t.string :marca
        t.string :cor
        t.string :km_atual
        t.references :a_status,       null: false, foreign_key: true
        t.references :g_tipo_veiculo, null: false, foreign_key: true
        t.references :a_unidade,      null: false, foreign_key: true
        t.references :g_centro_custo, null: false, foreign_key: true
            
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :g_veiculos if table_exists?(:g_veiculos)
  end
end
