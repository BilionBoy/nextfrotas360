# frozen_string_literal: true

class ACargo < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :a_status
  has_many   :a_usuarios_historicos_cargos_unidades

  validates :nome,      presence: true
  validates :descricao, presence: true
  validates :nivel,     presence: true
end
