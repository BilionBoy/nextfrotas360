# frozen_string_literal: true
class MakeOPropostasItensOptional < ActiveRecord::Migration[7.2]
  def change
    if table_exists?(:o_propostas_itens)
      if column_exists?(:o_propostas_itens, :o_cotacao_item_id)
        change_column_null :o_propostas_itens, :o_cotacao_item_id, true
      end

      if column_exists?(:o_propostas_itens, :quantidade)
        change_column_default :o_propostas_itens, :quantidade, from: nil, to: 0
        change_column_null    :o_propostas_itens, :quantidade, true
      end

      if column_exists?(:o_propostas_itens, :valor_unitario)
        change_column_default :o_propostas_itens, :valor_unitario, from: nil, to: 0
        change_column_null    :o_propostas_itens, :valor_unitario, true
      end

      if column_exists?(:o_propostas_itens, :total_item)
        change_column_default :o_propostas_itens, :total_item, from: nil, to: 0
        change_column_null    :o_propostas_itens, :total_item, true
      end
    end
  end
end
