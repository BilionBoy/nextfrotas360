# frozen_string_literal: true

class CreateFFinanceirosMovimentos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:f_financeiros_movimentos)
      create_table :f_financeiros_movimentos do |t|
        t.string     :descricao
        t.references :f_financeiro,  null: false, foreign_key: true
        t.references :g_tipo_movimento,  null: false, foreign_key: true
        t.string     :valor
        t.string     :observacao
            
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :f_financeiros_movimentos if table_exists?(:f_financeiros_movimentos)
  end
end
