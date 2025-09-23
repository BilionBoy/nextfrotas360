# frozen_string_literal: true

class CreateOUrgencias < ActiveRecord::Migration[7.2]
  unless table_exists?(:o_urgencias)
   def up
     create_table :o_urgencias do |t|
       t.string :descricao
           
       t.string :created_by
       t.string :updated_by
       t.datetime :deleted_at
       t.timestamps
     end
   end
  end

  def down
    drop_table :o_urgencias if table_exists?(:o_urgencias)
  end
end
