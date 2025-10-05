# frozen_string_literal: true
class OOrdemServicosController < ApplicationController
  before_action :set_o_ordem_servico, only: [:show, :finalizar, :aceitar_proposta, :rejeitar_proposta]
  before_action :authorize_user!

  # GET /o_ordem_servicos
  def index
    if current_user.gestor?
      @q = OOrdemServico.ransack(params[:q])
    elsif current_user.fornecedor?
      @q = OOrdemServico.where(f_empresa_fornecedora_id: current_user.f_empresa_fornecedora_id).ransack(params[:q])
    else
      redirect_to root_path, alert: "Acesso negado"
      return
    end

    @pagy, @o_ordem_servicos = pagy(
      @q.result.includes(:o_proposta, :f_empresa_fornecedora, :g_veiculo, :o_status).order(created_at: :desc)
    )
  end

  # GET /o_ordem_servicos/:id
  def show
    @itens_previstos = @o_ordem_servico.itens_previstos
  end

  # PATCH /o_ordem_servicos/:id/finalizar
  def finalizar
    unless current_user.fornecedor? && @o_ordem_servico.f_empresa_fornecedora_id == current_user.f_empresa_fornecedora_id
      redirect_to o_ordem_servicos_path, alert: "Acesso negado"
      return
    end

    concluida_status = OStatus.find_by!(descricao: "Concluída")
    if @o_ordem_servico.update(o_status: concluida_status)
      redirect_to o_ordem_servicos_path, notice: "Ordem de Serviço finalizada com sucesso"
    else
      redirect_to o_ordem_servico_path(@o_ordem_servico), alert: "Falha ao finalizar a OS"
    end
  end

  # PATCH /o_ordem_servicos/:id/aceitar_proposta
  def aceitar_proposta
    unless current_user.fornecedor? && @o_ordem_servico.f_empresa_fornecedora_id == current_user.f_empresa_fornecedora_id
      redirect_to o_ordem_servicos_path, alert: "Acesso negado"
      return
    end

    status_aceita = OStatus.find_by!(descricao: "Aprovada")
    if @o_ordem_servico.update(o_status: status_aceita)
      redirect_to o_ordem_servicos_path, notice: "Proposta aceita com sucesso"
    else
      redirect_to o_ordem_servico_path(@o_ordem_servico), alert: "Falha ao aceitar proposta"
    end
  end

  # PATCH /o_ordem_servicos/:id/rejeitar_proposta
  def rejeitar_proposta
    unless current_user.fornecedor? && @o_ordem_servico.f_empresa_fornecedora_id == current_user.f_empresa_fornecedora_id
      redirect_to o_ordem_servicos_path, alert: "Acesso negado"
      return
    end

    status_rejeitada = OStatus.find_by!(descricao: "Rejeitada")
    if @o_ordem_servico.update(o_status: status_rejeitada)
      redirect_to o_ordem_servicos_path, notice: "Proposta rejeitada com sucesso"
    else
      redirect_to o_ordem_servico_path(@o_ordem_servico), alert: "Falha ao rejeitar proposta"
    end
  end

  private

  def set_o_ordem_servico
    @o_ordem_servico = OOrdemServico.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to o_ordem_servicos_path, alert: "Ordem de Serviço não encontrada"
  end

  def authorize_user!
    unless current_user.gestor? || current_user.fornecedor?
      redirect_to root_path, alert: "Acesso negado"
    end
  end
end
