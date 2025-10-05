# frozen_string_literal: true

class GVeiculo < ApplicationRecord
  belongs_to :g_tipo_veiculo
  belongs_to :a_unidade
  belongs_to :g_centro_custo
  belongs_to :a_status

  # Validações condicional
  validates :ano, presence: true
  validates :placa, presence: true, uniqueness: { case_sensitive: false, allow_nil: true }, unless: :tipo_maquina?
  validates :km_atual, presence: true, unless: :tipo_maquina?
  validates :horimetro, presence: true, if: :tipo_maquina?

  def tipo_maquina?
    g_tipo_veiculo&.descricao == "Máquina"
  end
end
