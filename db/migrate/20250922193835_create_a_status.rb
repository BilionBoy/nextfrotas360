# frozen_string_literal: true

class CreateAStatus < ActiveRecord::Migration[7.2]
  unless table_exists?(:a_status)
   def up
     create_table :a_status do |t|
       t.string :descricao
           
       t.string :created_by
       t.string :updated_by
       t.datetime :deleted_at
       t.timestamps
     end
   end
  end

  def down
    drop_table :a_status if table_existS?(:a_status)
  end
end
