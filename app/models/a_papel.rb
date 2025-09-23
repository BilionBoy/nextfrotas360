# frozen_string_literal: true

class APapel < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :a_status
  has_many   :a_papeis_permissoes
  has_many   :a_usuarios_papeis

  validates :nome,      presence: true
  validates :descricao, presence: true
  
end
