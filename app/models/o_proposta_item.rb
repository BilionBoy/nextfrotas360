# frozen_string_literal: true
class OPropostaItem < ApplicationRecord
  belongs_to :o_proposta
  belongs_to :o_cotacao_item, optional: true  # deixa opcional se não tiver item da cotação

  # validações numéricas permitem nil
  validates :quantidade, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :valor_unitario, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  # callbacks
  before_validation :normalize_fields
  before_validation :calcular_total_item

  private

  # transforma strings vazias em nil
  def normalize_fields
    self.quantidade = nil if quantidade.blank?
    self.valor_unitario = nil if valor_unitario.blank?
  end

  # calcula o total do item
  def calcular_total_item
    self.total_item = (quantidade || 0) * (valor_unitario || 0)
  end
end
