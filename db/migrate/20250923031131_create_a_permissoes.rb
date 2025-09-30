# frozen_string_literal: true

class CreateAPermissoes < ActiveRecord::Migration[7.2]
  def up
    unless table_exists? :a_permissoes
      create_table :a_permissoes do |t|
        t.string :nome
        t.string :descricao
        t.string :recurso
        t.string :acao
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :a_permissoes if table_exists? :a_permissoes
  end
end
