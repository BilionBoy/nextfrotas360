# frozen_string_literal: true

class OSolicitacao < ApplicationRecord
  # Associações
  belongs_to :solicitante,         class_name: "User"
  belongs_to :publicado_por,       class_name: "User", optional: true
  belongs_to :o_tipo_solicitacao,  class_name: "OTipoSolicitacao"
  belongs_to :o_categoria_servico, class_name: "OCategoriaServico"
  belongs_to :o_status,            class_name: "OStatus"
  belongs_to :o_urgencia,          class_name: "OUrgencia", optional: true
  belongs_to :g_veiculo
  belongs_to :g_centro_custo

  # Validações
  validates :numero,      presence: true
  validates :solicitante, presence: true

  before_create :set_saldo_snapshot

  private

  # Preenche o saldo_snapshot com o saldo atual do centro de custo do solicitante, se existir
  def set_saldo_snapshot
    self.saldo_snapshot ||= g_centro_custo&.saldo_atual || 0.0
  end
end
