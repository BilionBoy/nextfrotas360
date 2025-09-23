# frozen_string_literal: true

class CreateAPapeis < ActiveRecord::Migration[7.2]
  unless table_exists?(:a_papeis)
   def up
     create_table :a_papeis do |t|
       t.string :nome
       t.string :descricao
       t.references :a_status, null: false, foreign_key: true
           
       t.string :created_by
       t.string :updated_by
       t.datetime :deleted_at
       t.timestamps
     end
   end
  end

  def down
    drop_table :a_papeis if table_exists?(:a_papeis)
  end
end
