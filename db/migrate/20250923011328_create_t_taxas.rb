# frozen_string_literal: true

class CreateTTaxas < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:t_taxas)
      create_table :t_taxas do |t|
        t.string :nome, null: false
        t.string :descricao
        t.decimal :percentual, precision: 5, scale: 2
        t.references :a_status, null: false, foreign_key: true
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :t_taxas if table_exists?(:t_taxas)
  end
end
