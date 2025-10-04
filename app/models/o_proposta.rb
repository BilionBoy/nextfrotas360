# frozen_string_literal: true
class OProposta < ApplicationRecord
  belongs_to :o_cotacao
  belongs_to :f_empresa_fornecedora
  belongs_to :usuario_envio, class_name: "User"
  belongs_to :o_status
  has_many :o_proposta_itens, class_name: "OPropostaItem", dependent: :destroy

  accepts_nested_attributes_for :o_proposta_itens, allow_destroy: true

  validates :valor_total, presence: true
  validates :prazo_execucao_dias, numericality: { greater_than: 0 }, allow_nil: true

  before_create :set_versao

  def gerar_itens_padrao!
    o_cotacao.o_cotacoes_itens.each do |cot_item|
      o_proposta_itens.find_or_initialize_by(o_cotacao_item: cot_item).tap do |item|
        item.quantidade ||= cot_item.quantidade || 0
        item.valor_unitario ||= 0
        item.total_item ||= 0
      end
    end
  end

  private

  def set_versao
    last_version = OProposta.where(o_cotacao_id: o_cotacao_id).maximum(:versao) || 0
    self.versao = last_version + 1
  end
end
