# frozen_string_literal: true

class CreateOStatusNf < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:o_status_nf)
      create_table :o_status_nf do |t|
        t.string :descricao
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :o_status_nf if table_exists?(:o_status_nf)
  end
end
