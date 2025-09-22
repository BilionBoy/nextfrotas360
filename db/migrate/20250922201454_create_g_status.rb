# frozen_string_literal: true

class CreateGStatus < ActiveRecord::Migration[7.2]
  unless table_exists?(:g_status)
   def up
     create_table :g_status do |t|
       t.string   :descricao
       t.string   :created_by
       t.string   :updated_by
       t.datetime :deleted_at
       t.timestamps
     end
   end
  end

  def down
    drop_table :g_status if table_exists?(:g_status)
  end
end
