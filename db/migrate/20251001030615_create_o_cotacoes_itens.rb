# frozen_string_literal: true

class CreateOCotacoesItens < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:o_cotacoes_itens)
     create_table :o_cotacoes_itens do |t|
       t.string     :descricao
       t.references :o_cotacao,            null: false, foreign_key: true
       t.references :o_categoria_servico,  null: false, foreign_key: true
       t.integer    :quantidade          
       t.decimal    :valor_unitario,      precision: 10, scale: 2
           
       t.string :created_by
       t.string :updated_by
       t.datetime :deleted_at
       t.timestamps
     end
    end
  end

  def down
    drop_table :o_cotacoes_itens if table_exists?(:o_cotacoes_itens)
  end
end
