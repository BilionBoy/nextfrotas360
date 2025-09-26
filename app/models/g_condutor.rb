# frozen_string_literal: true

class GCondutor < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :g_categoria_carteira_condutor
  belongs_to :g_status
  belongs_to :g_carteira_orgao_emissor

  validates :nome,         presence: true
  validates :cnh_numero,   presence: true
  validates :validade_cnh, presence: true
end
