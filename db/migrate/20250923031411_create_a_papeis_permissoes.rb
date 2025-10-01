# frozen_string_literal: true

class CreateAPapeisPermissoes < ActiveRecord::Migration[7.2]
  def up
    unless table_exists? :a_papeis_permissoes
      create_table :a_papeis_permissoes do |t|
        t.references :a_papel
        t.references :a_permissao, null: false, foreign_key: true
            
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end
 
  def down
    drop_table :a_papeis_permissoes if table_exists? :a_papeis_permissoes
  end
end
