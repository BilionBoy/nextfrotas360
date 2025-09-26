# frozen_string_literal: true

class CreateGCarteirasOrgaosEmissores < ActiveRecord::Migration[7.2]
  unless table_exists? :g_carteiras_orgaos_emissores
   def up
     create_table :g_carteiras_orgaos_emissores do |t|
       t.string :descricao
           
       t.string :created_by
       t.string :updated_by
       t.datetime :deleted_at
       t.timestamps
     end
   end
  end

  def down
    drop_table :g_carteiras_orgaos_emissores if table_exists? :g_carteiras_orgaos_emissores
  end
end
