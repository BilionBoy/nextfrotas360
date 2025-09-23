# frozen_string_literal: true

class APapel < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :a_status

  validates :nome,      presence: true
  validates :descricao, presence: true
  
end
