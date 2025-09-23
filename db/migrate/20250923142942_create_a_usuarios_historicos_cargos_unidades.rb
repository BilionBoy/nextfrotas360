# frozen_string_literal: true

class CreateAUsuariosHistoricosCargosUnidades < ActiveRecord::Migration[7.2]
  unless table_exists?(:a_usuarios_historicos_cargos_unidades)
   def up
     create_table :a_usuarios_historicos_cargos_unidades do |t|
       t.references :user,      null: false, foreign_key: true
       t.references :a_cargo,   null: false, foreign_key: true
       t.references :a_unidade, null: false, foreign_key: true
           
       t.string :created_by
       t.string :updated_by
       t.datetime :deleted_at
       t.timestamps
     end
   end
  end

  def down
    drop_table :a_usuarios_historicos_cargos_unidades if table_exists?(:a_usuarios_historicos_cargos_unidades)
  end
end
