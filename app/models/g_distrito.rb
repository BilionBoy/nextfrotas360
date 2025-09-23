class GDistrito < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :g_municipio

  validates :descricao, presence: true
end
