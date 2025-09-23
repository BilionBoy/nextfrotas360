# frozen_string_literal: true

class APermissao < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  has_many :a_papeis_permissoes

  validates :nome,      presence: true
  validates :recurso,   presence: true
  validates :acao,      presence: true
end
