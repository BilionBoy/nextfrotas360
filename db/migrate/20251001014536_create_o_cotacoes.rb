# frozen_string_literal: true

class CreateOCotacoes < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:o_cotacoes)
      create_table :o_cotacoes do |t|
        t.references :o_solicitacao,  null: false, foreign_key: true
        t.references :o_visibilidade, null: false, foreign_key: true
        t.references :o_status,       null: false, foreign_key: true
        t.datetime :data_expiracao
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :o_cotacoes if table_exists?(:o_cotacoes)
  end
end
