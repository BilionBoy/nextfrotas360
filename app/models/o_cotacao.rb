class OCotacao < ApplicationRecord
  belongs_to :o_solicitacao
  belongs_to :o_visibilidade
  belongs_to :o_status
  has_many :o_cotacoes_itens, class_name: 'OCotacaoItem'
  
  validates :data_expiracao, presence: true
  after_create :marcar_solicitacao_em_cotacao

  scope :abertas_para_fornecedor, ->(fornecedor) {
   where(o_status: OStatus.find_by(descricao: "Pendente"))
   .where.not(id: OProposta.where(f_empresa_fornecedora: fornecedor.f_empresa_fornecedora).select(:o_cotacao_id))
  }
  def descricao_completa
    "#{id} - #{o_solicitacao.descricao}"
  end
 

  private

  def marcar_solicitacao_em_cotacao
    em_cotacao = OStatus.find_by(descricao: "Em Cotação")
    o_solicitacao.update(o_status: em_cotacao) if em_cotacao
  end

end
