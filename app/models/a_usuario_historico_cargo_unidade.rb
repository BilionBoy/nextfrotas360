# frozen_string_literal: true

class AUsuarioHistoricoCargoUnidade < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :user
  belongs_to :a_cargo
  belongs_to :a_unidade
end
