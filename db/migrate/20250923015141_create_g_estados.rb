# frozen_string_literal: true

class CreateGEstados < ActiveRecord::Migration[7.2]
  unless table_exists?(:g_estados)
   def up
     create_table :g_estados do |t|
       t.string :descricao
       t.string :uf
       t.references :g_pais, null: false, foreign_key: true
       t.string :created_by
       t.string :updated_by
       t.datetime :deleted_at
       t.timestamps
     end
   end
  end

  def down
    drop_table :g_estados if table_exists?(:g_estados)
  end
end
