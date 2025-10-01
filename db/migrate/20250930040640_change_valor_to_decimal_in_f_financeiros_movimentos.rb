# frozen_string_literal: true

class ChangeValorToDecimalInFFinanceirosMovimentos < ActiveRecord::Migration[7.2]
  def up
    if table_exists?(:f_financeiros_movimentos) && column_exists?(:f_financeiros_movimentos, :valor)
      change_column :f_financeiros_movimentos, :valor, :decimal,
                    precision: 15, scale: 2, default: 0.0, null: false,
                    using: 'valor::numeric'
    end
  end

  def down
    if table_exists?(:f_financeiros_movimentos) && column_exists?(:f_financeiros_movimentos, :valor)
      change_column :f_financeiros_movimentos, :valor, :string
    end
  end
end
