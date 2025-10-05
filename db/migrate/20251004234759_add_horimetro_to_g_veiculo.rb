# frozen_string_literal: true

class AddHorimetroToGVeiculo < ActiveRecord::Migration[7.2]
  def up
    # Adiciona a coluna horimetro apenas se não existir
    unless column_exists?(:g_veiculos, :horimetro)
      add_column :g_veiculos, :horimetro, :decimal, precision: 15, scale: 2, default: 0.0, null: false
    end
  end

  def down
    # Remove a coluna horimetro apenas se existir
    remove_column :g_veiculos, :horimetro if column_exists?(:g_veiculos, :horimetro)
  end
end
