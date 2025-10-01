# frozen_string_literal: true

class GTipoMovimento < ApplicationRecord
  has_many   :f_financeiros_movimentos

  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  validates :descricao, presence: true
end
