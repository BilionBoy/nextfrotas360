class OCotacao < ApplicationRecord
  belongs_to :o_solicitacao
  belongs_to :o_visibilidade
  belongs_to :o_status
  has_many :o_cotacoes_itens, class_name: "OCotacaoItem", foreign_key: "o_cotacao_id", dependent: :destroy
  has_many :o_propostas,      class_name: "OProposta",   foreign_key: "o_cotacao_id", dependent: :destroy  
  
  validates :data_expiracao, presence: true
  before_validation :set_visibilidade_publica, on: :create
  before_validation :set_status_pendente
  after_create :marcar_solicitacao_em_cotacao


 scope :abertas_para_fornecedor, ->(fornecedor) {
  status_pendente = OStatus.find_by(descricao: "Pendente")
  where(o_status: status_pendente)
  .where.not(
    id: OProposta.where(f_empresa_fornecedora_id: fornecedor.id).select(:o_cotacao_id)
  )
}

  def descricao_completa
    "#{id} - #{o_solicitacao.descricao}"
  end
 

  private


  def set_visibilidade_publica
   self.o_visibilidade ||= OVisibilidade.find_by(descricao: "Pública")
  end
  
  def set_status_pendente
    self.o_status ||= OStatus.find_by(descricao: "Pendente")
  end
  
  def marcar_solicitacao_em_cotacao
    em_cotacao = OStatus.find_by(descricao: "Em Cotação")
    o_solicitacao.update(o_status: em_cotacao) if em_cotacao
  end

end
