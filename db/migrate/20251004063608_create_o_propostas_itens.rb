# frozen_string_literal: true

class CreateOPropostasItens < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:o_propostas_itens)
      create_table :o_propostas_itens do |t|
        t.references :o_proposta,                   null: false,  foreign_key: true
        t.references :o_cotacao_item,               null: false,  foreign_key: true
        t.decimal :quantidade,                      precision: 10, scale: 2, null: false
        t.decimal :valor_unitario,                  precision: 15, scale: 2, null: false
        t.decimal :total_item,                      precision: 15, scale: 2, null: false
        t.string :observacao

        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :o_propostas_itens if table_exists?(:o_propostas_itens)
  end
end
