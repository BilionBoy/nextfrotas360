# frozen_string_literal: true
class GCentroCusto < ApplicationRecord
  has_many :o_solicitacoes
  belongs_to :g_tipo_centro_custo
  belongs_to :a_unidade

  validates :nome, presence: true
  validates :codigo_dotacao, presence: true
  validate :valor_inicial_menor_que_saldo_atual

  # -----------------------------
  # Debita valor e atualiza snapshot
  # -----------------------------
  def debitar!(valor)
    raise "Saldo insuficiente" if saldo_atual.to_f < valor.to_f

    update!(
      saldo_atual: saldo_atual - valor,
      saldo_snapshot: saldo_atual - valor
    )
  end

  private

  def valor_inicial_menor_que_saldo_atual
    if valor_inicial.present? && saldo_atual.present? && valor_inicial < saldo_atual
      errors.add(:valor_inicial, "não pode ser menor que o saldo atual (#{saldo_atual})")
    end
  end
end