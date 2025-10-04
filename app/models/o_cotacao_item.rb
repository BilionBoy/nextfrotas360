# frozen_string_literal: true

class OCotacaoItem < ApplicationRecord
  belongs_to :o_cotacao
  belongs_to :o_categoria_servico
  has_many :o_proposta_itens, class_name: "OPropostaItem", foreign_key: "o_cotacao_item_id", dependent: :destroy

  # validações básicas
  validates :descricao,      presence: true
  validates :quantidade,     numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :valor_unitario, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true


end
