# frozen_string_literal: true

class CreateACargos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:a_cargos)
      create_table :a_cargos do |t|
        t.string :nome
        t.string :descricao
        t.integer :nivel
        t.references :a_status, null: false, foreign_key: true
            
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :a_cargos if table_exists?(:a_cargos)
  end
end
