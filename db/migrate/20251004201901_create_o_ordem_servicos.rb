# frozen_string_literal: true

class CreateOOrdemServicos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:o_ordem_servicos)
      create_table :o_ordem_servicos do |t|
        t.string :numero_os,                 null: false
        t.references :o_proposta,            null: false, foreign_key: { to_table: :o_propostas }
        t.references :f_empresa_fornecedora, null: false, foreign_key: { to_table: :f_empresas_fornecedoras }
        t.references :g_veiculo,             null: false, foreign_key: { to_table: :g_veiculos }
        t.references :o_status, null: false, foreign_key: { to_table: :o_status }
        t.references :validado_por,                       foreign_key: { to_table: :users }
        t.json :itens_previstos,  default: []
        t.json :itens_executados, default: []
        t.datetime :data_inicio_prevista
        t.datetime :data_termino_prevista
        t.datetime :data_inicio_real
        t.datetime :data_termino_real
        t.decimal :custo_real, precision: 15, scale: 2, default: 0.0
        t.text :observacoes
        t.datetime :validado_em
        # Auditoria
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at

        t.timestamps
      end

      # Índices adicionais
      add_index :o_ordem_servicos, :numero_os, unique: true
      add_index :o_ordem_servicos, :deleted_at
    end
  end

  def down
    drop_table :o_ordem_servicos if table_exists?(:o_ordem_servicos)
  end
end
