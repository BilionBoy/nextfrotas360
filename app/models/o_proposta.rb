class OProposta < ApplicationRecord
  belongs_to :o_cotacao
  belongs_to :f_empresa_fornecedora
  belongs_to :usuario_envio, class_name: "User"
  belongs_to :o_status
  has_many :o_proposta_items, dependent: :destroy

  validates :valor_total, presence: true
  validates :prazo_execucao_dias, numericality: { greater_than: 0 }, allow_nil: true

  before_create :set_versao

  private

  def set_versao
    last_version = OProposta.where(o_cotacao_id: o_cotacao_id).maximum(:versao) || 0
    self.versao = last_version + 1
  end
end
