# frozen_string_literal: true

class GVeiculo < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :g_tipo_veiculo
  belongs_to :a_unidade
  belongs_to :g_centro_custo
  belongs_to :a_status   

  validates :placa,    presence: true, uniqueness: true
  validates :ano,      presence: true
  validates :km_atual, presence: true

end
