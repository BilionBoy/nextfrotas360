# frozen_string_literal: true
class OPropostaItem < ApplicationRecord
  belongs_to :o_proposta
  belongs_to :o_cotacao_item

  validates :quantidade, :valor_unitario, :total_item, presence: true

  before_validation :calcular_total_item

  private

  def calcular_total_item
    self.total_item = (quantidade || 0) * (valor_unitario || 0)
  end
end
