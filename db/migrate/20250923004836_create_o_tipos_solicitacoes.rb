# frozen_string_literal: true

class CreateOTiposSolicitacoes < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:o_tipos_solicitacoes)
      create_table :o_tipos_solicitacoes do |t|
        t.string :descricao
            
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :o_tipos_solicitacoes if table_exists?(:o_tipos_solicitacoes)
  end
end
