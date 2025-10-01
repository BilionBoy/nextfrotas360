# frozen_string_literal: true

class CreateGCategoriasCarteirasCondutores < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:g_categorias_carteiras_condutores)
      create_table :g_categorias_carteiras_condutores do |t|
        t.string :descricao
            
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :g_categorias_carteiras_condutores if table_exists?(:g_categorias_carteiras_condutores)
  end
end
