# frozen_string_literal: true

class CreateOStatus < ActiveRecord::Migration[7.2]
  unless table_exists?(:o_status)
   def up
     create_table :o_status do |t|
       t.string :descricao
       t.string :created_by
       t.string :updated_by
       t.datetime :deleted_at
       t.timestamps
     end
   end
  end

  def down
    drop_table :o_status if table_exists?(:o_status)
  end
end
