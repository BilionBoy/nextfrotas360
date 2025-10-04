# frozen_string_literal: true
class OPropostaItem < ApplicationRecord
  belongs_to :o_proposta
  belongs_to :o_cotacao_item

  validates :quantidade, :valor_unitario, presence: true
  validates :total_item, presence: true

  after_save :atualizar_valor_total_proposta

  private

  def atualizar_valor_total_proposta
    total = o_proposta.o_proposta_itens.sum("quantidade * valor_unitario")
    o_proposta.update(
      valor_total: total,
      status_id: Status.find_by(descricao: "Enviada").id
    )
  end
end
