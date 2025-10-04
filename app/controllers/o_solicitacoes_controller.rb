# frozen_string_literal: true
class OSolicitacoesController < ApplicationController
  before_action :set_o_solicitacao, only: %i[show edit update destroy]
  load_and_authorize_resource
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OSolicitacao.ransack(params[:q])
    @o_solicitacoes = @q.result.accessible_by(current_ability)
    @pagy, @o_solicitacoes = pagy(@o_solicitacoes)
  end

  def new
    @o_solicitacao = OSolicitacao.new
    if params[:g_centro_custo_id].present?
      centro = GCentroCusto.find_by(id: params[:g_centro_custo_id])
      @o_solicitacao.saldo_snapshot = centro&.saldo_atual || 0
    end
  end

  def edit
  end

  def create
    @o_solicitacao = OSolicitacao.new(o_solicitacao_params)
    @o_solicitacao.solicitante = current_user

    if @o_solicitacao.save
      redirect_to o_solicitacoes_path, notice: t('messages.created_successfully'), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @o_solicitacao.update(o_solicitacao_params)
      redirect_to o_solicitacoes_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_solicitacao.destroy
      redirect_to o_solicitacoes_url, notice: t('messages.deleted_successfully')
    else
      redirect_to o_solicitacoes_url, alert: t('messages.delete_failed_due_to_dependencies')
    end
  end

  # rota AJAX para buscar saldo
  def saldo_centro
    centro = GCentroCusto.find_by(id: params[:id])
    render json: { saldo: centro&.saldo_atual || 0.0 }
  end

  private

  def set_o_solicitacao
    @o_solicitacao = OSolicitacao.find_by(id: params[:id])
    return redirect_to o_solicitacoes_path, alert: t('messages.not_found') unless @o_solicitacao
  end

  def o_solicitacao_params
    permitted_attributes = OSolicitacao.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:o_solicitacao).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to o_solicitacoes_path, alert: t('messages.not_found')
  end
end





