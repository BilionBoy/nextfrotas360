# frozen_string_literal: true

class FFinanceiro < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :f_empresa_fornecedora
  belongs_to :o_categoria_servico
  has_many   :f_financeiros_movimentos
end
