# frozen_string_literal: true

class APapelPermissao < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :a_papel
  belongs_to :a_permissao
  
end
