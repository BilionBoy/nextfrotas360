# frozen_string_literal: true

class CreateOPropostas < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:o_propostas)
      create_table :o_propostas do |t|
        t.references :o_cotacao,             null: false, foreign_key: true
        t.references :f_empresa_fornecedora, null: false, foreign_key: true
        t.references :usuario_envio,         null: false, foreign_key: { to_table: :users }
        t.references :o_status,              null: false, foreign_key: true
        t.decimal    :valor_total,           precision: 15, scale: 2
        t.integer    :prazo_execucao_dias
        t.datetime   :validade_proposta
        t.integer    :versao, default: 1
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :o_propostas if table_exists?(:o_propostas)
  end
end
