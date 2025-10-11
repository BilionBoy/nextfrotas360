# frozen_string_literal: true

class GCentroCusto < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :g_tipo_centro_custo
  belongs_to :a_unidade

  validates :nome, presence: true
  validates :codigo_dotacao, presence: true
  validate :valor_inicial_menor_que_saldo_atual

  private
  
 def valor_inicial_menor_que_saldo_atual
  if valor_inicial.present? && saldo_atual.present?
    if valor_inicial < saldo_atual
      errors.add(:valor_inicial, "não pode ser menor que o saldo atual (#{saldo_atual})")
    end
  end
 end

end
