# frozen_string_literal: true
class OOrdemServicosController < ApplicationController
  before_action :set_o_ordem_servico, only: [:show, :marcar_como_atendida, :validar_servico, :aplicar_taxa_admin]

  # GET /o_ordem_servicos
  def index
    @q = OOrdemServico.accessible_by(current_ability).ransack(params[:q])
    @pagy, @o_ordem_servicos = pagy(
      @q.result
        .includes(
          :o_status,
          :g_veiculo,
          :f_empresa_fornecedora,
          :t_taxa,
          o_proposta: [:o_status, o_cotacao: :o_solicitacao]
        )
        .order(created_at: :desc)
    )
  end

  # PATCH /o_ordem_servicos/:id/marcar_como_atendida
  def marcar_como_atendida
    authorize_fornecedor!
    @o_ordem_servico.marcar_como_atendida!
    redirect_to o_ordem_servicos_path, notice: "Ordem marcada como atendida — aguardando validação do gestor."
  rescue ActiveRecord::RecordInvalid => e
    redirect_to o_ordem_servico_path(@o_ordem_servico), alert: "Falha ao atualizar: #{e.message}"
  end

  # PATCH /o_ordem_servicos/:id/validar_servico
  def validar_servico
    redirect_unless_gestor!
    @o_ordem_servico.finalizar!(current_user)
    redirect_to o_ordem_servicos_path, notice: "Serviço validado com sucesso — OS concluída."
  rescue ActiveRecord::RecordInvalid => e
    redirect_to o_ordem_servico_path(@o_ordem_servico), alert: "Falha ao validar: #{e.message}"
  end

  # PATCH /o_ordem_servicos/:id/aplicar_taxa_admin
  def aplicar_taxa_admin
    redirect_unless_admin!
    
    taxa_id = params[:t_taxa_id]
    @o_ordem_servico.aplicar_taxa_admin!(current_user, taxa_id)

    redirect_to o_ordem_servicos_path, notice: "Taxa aplicada e pagamento registrado com sucesso."
  rescue ActiveRecord::RecordInvalid, StandardError => e
    redirect_to o_ordem_servicos_path, alert: "Erro ao aplicar taxa: #{e.message}"
  end

  private

  def set_o_ordem_servico
    @o_ordem_servico = OOrdemServico.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to o_ordem_servicos_path, alert: "Ordem de Serviço não encontrada"
  end

  def authorize_fornecedor!
    unless current_user.fornecedor? && @o_ordem_servico.f_empresa_fornecedora_id == current_user.f_empresa_fornecedora_id
      redirect_to o_ordem_servicos_path, alert: "Acesso negado"
    end
  end

  def redirect_unless_gestor!
    redirect_to o_ordem_servicos_path, alert: "Acesso negado" unless current_user.gestor?
  end

  def redirect_unless_admin!
    redirect_to o_ordem_servicos_path, alert: "Acesso negado" unless current_user.admin?
  end
end
