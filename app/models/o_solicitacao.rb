class OSolicitacao < ApplicationRecord
  belongs_to :solicitante, class_name: "User"
  belongs_to :publicado_por, class_name: "User", optional: true
  belongs_to :o_tipo_solicitacao, class_name: "OTipoSolicitacao", optional: true
  belongs_to :o_categoria_servico, class_name: "OCategoriaServico"
  belongs_to :o_status, class_name: "OStatus"
  belongs_to :o_urgencia, class_name: "OUrgencia", optional: true
  belongs_to :g_veiculo
  belongs_to :g_centro_custo

  has_one :o_cotacao, class_name: "OCotacao", foreign_key: "o_solicitacao_id", dependent: :destroy

  validates :solicitante, presence: true

  before_create     :set_saldo_snapshot
  before_validation :set_status_pendente, on: :create
  before_validation :set_numero, on: :create

  private

  def set_saldo_snapshot
    self.saldo_snapshot ||= g_centro_custo&.saldo_atual || 0.0
  end

  def set_status_pendente
    self.o_status ||= OStatus.find_by(descricao: 'Pendente')
  end

  def set_numero
    self.numero ||= (OSolicitacao.maximum(:numero) || 0) + 1
  end
end
