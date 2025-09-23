# frozen_string_literal: true

class GMunicipio < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :g_estado
  
  validates :codigo_ibge, presence: true
  validates :descricao,   presence: true

end
