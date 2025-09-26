# frozen_string_literal: true

class CreateGCondutores < ActiveRecord::Migration[7.2]
  unless table_exists? :g_condutores
   def up
     create_table :g_condutores do |t|
       t.string :nome
       t.string :email
       t.string :telefone
       t.string :cnh_numero
       t.datetime :validade_cnh
       t.references :g_categoria_carteira_condutor, null: false, foreign_key: true
       t.references :g_status,                      null: false, foreign_key: true
       t.references :g_carteira_orgao_emissor,      null: false, foreign_key: true
           
       t.string :created_by
       t.string :updated_by
       t.datetime :deleted_at
       t.timestamps
     end
   end
  end

  def down
    drop_table :g_condutores if table_exists? :g_condutores
  end
end
