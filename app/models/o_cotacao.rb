class OCotacao < ApplicationRecord
  belongs_to :o_solicitacao
  belongs_to :o_visibilidade
  belongs_to :o_status

  validates :data_expiracao, presence: true

  after_create :marcar_solicitacao_em_cotacao

  private

  def marcar_solicitacao_em_cotacao
    em_cotacao = OStatus.find_by(descricao: "Em Cotação")
    o_solicitacao.update(o_status: em_cotacao) if em_cotacao
  end
end
