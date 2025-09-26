# frozen_string_literal: true

class GCondutorVeiculo < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :g_condutor
  belongs_to :g_veiculo

  validates :data_inicio, presence: true
end
