# frozen_string_literal: true
class OOrdemServico < ApplicationRecord
  belongs_to :o_proposta
  belongs_to :f_empresa_fornecedora
  belongs_to :g_veiculo
  belongs_to :o_status
  belongs_to :validado_por, class_name: 'User', optional: true
  belongs_to :t_taxa, optional: true

  validates :numero_os, presence: true, uniqueness: true
  validates :o_proposta, :f_empresa_fornecedora, :g_veiculo, :o_status, presence: true

  before_validation :gerar_numero_os, on: :create

  # -----------------------------
  # Gera número da OS
  # -----------------------------
  def gerar_numero_os
    self.numero_os ||= "OS#{Time.current.strftime('%Y%m%d')}#{SecureRandom.hex(3).upcase}"
  end

  # -----------------------------
  # Marca como atendida
  # -----------------------------
  def marcar_como_atendida!
    update!(o_status: OStatus.find_by!(descricao: 'Atendida'))
  end

  # -----------------------------
  # Finaliza a OS
  # -----------------------------
  def finalizar!(usuario)
    transaction do
      aplicar_taxa!  # aplica taxa antes de concluir
      update!(o_status: OStatus.find_by!(descricao: 'Concluída'),
              validado_por: usuario,
              validado_em: Time.current)
      o_proposta.o_cotacao.o_solicitacao.update!(o_status: OStatus.find_by!(descricao: 'Concluída'))
      o_proposta.o_cotacao.marcar_concluida!
      o_proposta.marcar_concluida!
    end
  end

  # -----------------------------
  # Custo real baseado na proposta
  # -----------------------------
  def custo_real
    o_proposta&.valor_total.to_f
  end

  # -----------------------------
  # Aplica taxa
  # -----------------------------
  def aplicar_taxa!
    return unless t_taxa.present?

    self.taxa_aplicada = (custo_real * t_taxa.percentual / 100).round(2)
    save!
  end
end
