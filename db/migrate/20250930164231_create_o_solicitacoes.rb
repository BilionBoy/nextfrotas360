# frozen_string_literal: true

class CreateOSolicitacoes < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:o_solicitacoes)
      create_table :o_solicitacoes do |t|
        t.integer    :numero, null: false
        t.string     :descricao
        t.integer    :km_reportado
        t.datetime   :data_limite_publicacao
        t.datetime   :publicado_em
        t.decimal    :saldo_snapshot, precision: 15, scale: 2
        t.references :solicitante, null: false, foreign_key: { to_table: :users }
        t.references :publicado_por, foreign_key: { to_table: :users }
        t.references :g_veiculo,     null: false, foreign_key: true
        t.references :g_centro_custo,  null: false, foreign_key: true
        t.references :o_tipo_solicitacao, null: false, foreign_key: { to_table: :o_tipos_solicitacoes }
        t.references :o_categoria_servico, null: false, foreign_key: { to_table: :o_categorias_servicos }
        t.references :o_status, null: false, foreign_key: { to_table: :o_status }
        t.references :o_urgencia, foreign_key: { to_table: :o_urgencias }

        t.string   :created_by
        t.string   :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :o_solicitacoes if table_exists?(:o_solicitacoes)
  end
end
