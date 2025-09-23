# frozen_string_literal: true

class GEstado < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :g_pais 
   
  validates :descricao, presence: true
  validates :uf, presence: true, length: { is: 2 }
end
