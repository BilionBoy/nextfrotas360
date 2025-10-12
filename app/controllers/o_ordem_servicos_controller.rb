# frozen_string_literal: true
class OOrdemServicosController < ApplicationController
  before_action :set_o_ordem_servico, only: [:show, :marcar_como_atendida, :validar_servico]
  before_action :authorize_user!

  # GET /o_ordem_servicos
  def index
    base_scope = if current_user.gestor?
                   OOrdemServico.all
                 elsif current_user.fornecedor?
                   OOrdemServico.where(f_empresa_fornecedora_id: current_user.f_empresa_fornecedora_id)
                 else
                   redirect_to root_path, alert: "Acesso negado" and return
                 end

    @q = base_scope.ransack(params[:q])
    @pagy, @o_ordem_servicos = pagy(
      @q.result
        .includes(
          :o_status,
          :g_veiculo,
          :f_empresa_fornecedora,
          o_proposta: [:o_status, o_cotacao: :o_solicitacao]
        )
        .order(created_at: :desc)
    )
    @o_ordem_servicos.each(&:reload)
  end

  # GET /o_ordem_servicos/:id
  def show
    @itens_previstos = @o_ordem_servico.itens_previstos
  end

  # PATCH /o_ordem_servicos/:id/marcar_como_atendida
  def marcar_como_atendida
    unless current_user.fornecedor? && @o_ordem_servico.f_empresa_fornecedora_id == current_user.f_empresa_fornecedora_id
      redirect_to o_ordem_servicos_path, alert: "Acesso negado" and return
    end

    ActiveRecord::Base.transaction do
      @o_ordem_servico.marcar_como_atendida!
      @o_ordem_servico.o_proposta&.o_cotacao&.o_solicitacao&.update!(o_status: OStatus.find_by!(descricao: "Atendida"))
    end

    redirect_to o_ordem_servicos_path, notice: "Ordem marcada como atendida — aguardando validação do gestor."
  rescue ActiveRecord::RecordInvalid => e
    redirect_to o_ordem_servico_path(@o_ordem_servico), alert: "Falha ao atualizar: #{e.message}"
  end

  # PATCH /o_ordem_servicos/:id/validar_servico
  def validar_servico
    unless current_user.gestor?
      redirect_to o_ordem_servicos_path, alert: "Apenas gestores podem validar o serviço." and return
    end

    ActiveRecord::Base.transaction do
      @o_ordem_servico.finalizar!(current_user)
      @o_ordem_servico.o_proposta&.o_cotacao&.o_solicitacao&.update!(o_status: OStatus.find_by!(descricao: "Concluída"))
    end

    redirect_to o_ordem_servicos_path, notice: "Serviço validado com sucesso — OS concluída."
  rescue ActiveRecord::RecordInvalid => e
    redirect_to o_ordem_servico_path(@o_ordem_servico), alert: "Falha ao validar: #{e.message}"
  end

  private

  def set_o_ordem_servico
    @o_ordem_servico = OOrdemServico.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to o_ordem_servicos_path, alert: "Ordem de Serviço não encontrada"
  end

  def authorize_user!
    redirect_to root_path, alert: "Acesso negado" unless current_user.gestor? || current_user.fornecedor?
  end
end
