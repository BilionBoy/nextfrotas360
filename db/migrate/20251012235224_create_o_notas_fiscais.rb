# frozen_string_literal: true

class CreateONotasFiscais < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:o_notas_fiscais)
      create_table :o_notas_fiscais do |t|
        t.references :o_ordem_servico, foreign_key: true
        t.string :numero
        t.date :data_emissao
        t.string :valor_total
        t.references :o_status_nf, foreign_key: true

        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :o_notas_fiscais if table_exists?(:o_notas_fiscais)
  end
end
