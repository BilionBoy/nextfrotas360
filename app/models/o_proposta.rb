# frozen_string_literal: true
class OProposta < ApplicationRecord
  belongs_to :o_cotacao
  belongs_to :f_empresa_fornecedora
  belongs_to :usuario_envio, class_name: "User"
  belongs_to :o_status
  has_many   :o_proposta_itens, class_name: "OPropostaItem", dependent: :destroy

  accepts_nested_attributes_for :o_proposta_itens, allow_destroy: true

  validates :valor_total, presence: true
  validates :prazo_execucao_dias, numericality: { greater_than: 0 }, allow_nil: true

  before_create :set_versao

  # Gera itens padrão da cotação
  def gerar_itens_padrao!
    o_cotacao.o_cotacoes_itens.each do |cot_item|
      o_proposta_itens.find_or_initialize_by(o_cotacao_item: cot_item).tap do |item|
        item.quantidade ||= cot_item.quantidade || 0
        item.valor_unitario ||= 0
        item.total_item ||= 0
      end
    end
  end

  # Aprova a proposta e cria OS
 # Aprova a proposta e cria OS
def aprovar!(gestor)
  raise "Apenas gestores podem aprovar propostas" unless gestor&.gestor?

  transaction do
    # Atualiza status da proposta para Aprovada
    update!(o_status: OStatus.find_by!(descricao: "Aprovada"))

    # Cria a Ordem de Serviço
    OOrdemServico.create!(
      o_proposta: self,
      f_empresa_fornecedora: f_empresa_fornecedora,
      g_veiculo: o_cotacao.o_solicitacao.g_veiculo,
      o_status: OStatus.find_by!(descricao: "Aberta"),
      data_inicio_prevista: Date.today,
      data_termino_prevista: Date.today + (prazo_execucao_dias || 1).days,
      itens_previstos: o_proposta_itens.map do |i|
        {
          descricao: i.o_cotacao_item.descricao,
          quantidade: i.quantidade,
          valor_unitario: i.valor_unitario,
          total_item: i.total_item
        }
      end
    )
  end
end


  private

  def set_versao
    last_version = OProposta.where(o_cotacao_id: o_cotacao_id).maximum(:versao) || 0
    self.versao = last_version + 1
  end
end
