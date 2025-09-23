# frozen_string_literal: true

class GPais < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  validates :descricao, presence: true
  validates :sigla, presence: true, length: { is: 2 }
end
