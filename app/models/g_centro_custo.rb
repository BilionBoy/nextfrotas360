# frozen_string_literal: true

class GCentroCusto < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :g_tipo_centro_custo
  belongs_to :a_unidade

  validates :nome, presence: true
  validates :codigo_dotacao, presence: true
  
end
