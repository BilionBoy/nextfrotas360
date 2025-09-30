# frozen_string_literal: true

class CreateOCategoriasServicos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:o_categorias_servicos)
      create_table :o_categorias_servicos do |t|
        t.string :descricao
            
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :o_categorias_servicos if table_exists?(:o_categorias_servicos)
  end
end
