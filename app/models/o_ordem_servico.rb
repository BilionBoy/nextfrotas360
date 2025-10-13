# frozen_string_literal: true
class OOrdemServico < ApplicationRecord
  belongs_to :o_proposta
  belongs_to :f_empresa_fornecedora
  belongs_to :g_veiculo
  belongs_to :o_status
  belongs_to :validado_por, class_name: 'User', optional: true
  belongs_to :t_taxa, optional: true
  has_many :o_notas_fiscais, dependent: :destroy
  
  validates :numero_os, presence: true, uniqueness: true
  validates :o_proposta, :f_empresa_fornecedora, :g_veiculo, :o_status, presence: true

  before_validation :gerar_numero_os, on: :create




  # -----------------------------
  # Aplica taxa admin e debita do centro de custo
  # -----------------------------
  # -----------------------------
  def aplicar_taxa_admin!(usuario, taxa_id)
    raise "Taxa inválida" unless taxa_id.present?

    taxa = TTaxa.find(taxa_id)
    solicitacao = o_proposta.o_cotacao.o_solicitacao
    cc = solicitacao.g_centro_custo

    transaction do
      # Calcula valor da taxa
      self.t_taxa = taxa
      self.taxa_aplicada = (custo_real * taxa.percentual / 100).round(2)

      # Verifica saldo suficiente
      raise "Saldo insuficiente no centro de custo" if cc.saldo_atual < taxa_aplicada

      # Debita do centro de custo
      cc.update!(saldo_atual: cc.saldo_atual - taxa_aplicada)

      # Atualiza snapshot da solicitação
      solicitacao.update!(saldo_snapshot: cc.saldo_atual)

      # Atualiza OS
      self.o_status = OStatus.find_by!(descricao: 'Pago')
      self.validado_por = usuario
      self.validado_em = Time.current
      save!
    end
  end


  # -----------------------------
  # Gera número da OS
  # -----------------------------
  def gerar_numero_os
    self.numero_os ||= "OS#{Time.current.strftime('%Y%m%d')}#{SecureRandom.hex(3).upcase}"
  end

  # -----------------------------
  # Custo real baseado na proposta
  # -----------------------------
  def custo_real
    o_proposta&.valor_total.to_f
  end

    # Marca a OS como atendida
  def marcar_como_atendida!
    update!(o_status: OStatus.find_by!(descricao: 'Atendida'))
  end

  # -----------------------------
  # Finaliza OS (opcional)
  # -----------------------------
  def finalizar!(usuario)
    transaction do
      aplicar_taxa_admin!(usuario, t_taxa_id) if t_taxa.present?
      update!(o_status: OStatus.find_by!(descricao: 'Concluída'),
              validado_por: usuario,
              validado_em: Time.current)
      o_proposta.o_cotacao.o_solicitacao.update!(o_status: OStatus.find_by!(descricao: 'Concluída'))
      o_proposta.o_cotacao.marcar_concluida!
      o_proposta.marcar_concluida!
    end
  end
end