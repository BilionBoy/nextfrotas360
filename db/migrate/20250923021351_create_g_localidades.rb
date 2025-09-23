# frozen_string_literal: true

class CreateGLocalidades < ActiveRecord::Migration[7.2]
  unless table_exists?(:g_localidades)
   def up
     create_table :g_localidades do |t|
       t.string :descricao
       t.references :g_distrito
       t.string :created_by
       t.string :updated_by
       t.datetime :deleted_at
       t.timestamps
     end
   end
  end

  def down
    drop_table :g_localidades if table_exists?(:g_localidades)
  end
end
