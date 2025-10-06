class MakeOCotacaoItemOptionalInOPropostaItens < ActiveRecord::Migration[7.0]
  def change
    if table_exists?(:o_propostas_itens) && column_exists?(:o_propostas_itens, :o_cotacao_item_id)
      change_column_null :o_propostas_itens, :o_cotacao_item_id, true
    end
  end
end
