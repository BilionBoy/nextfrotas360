# frozen_string_literal: true
class GCentroCustoMovimento < ApplicationRecord
  belongs_to :g_centro_custo
  belongs_to :g_tipo_movimento

  # Polimórfico: vincula o movimento a Solicitação, OS ou OC
  belongs_to :referenciavel, polymorphic: true, optional: true

  validates :valor, presence: true
end
