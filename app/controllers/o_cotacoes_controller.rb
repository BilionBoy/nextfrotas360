# frozen_string_literal: true
class OCotacoesController < ApplicationController
  before_action :set_o_cotacao, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OCotacao.ransack(params[:q])
    @pagy, @o_cotacoes = pagy(@q.result.includes(:o_solicitacao, :o_status))
  end

  def new
    @o_cotacao = OCotacao.new
    @o_cotacao.o_solicitacao_id = params[:solicitacao_id] if params[:solicitacao_id].present?
  end

  def edit; end

  def create
    @o_cotacao = OCotacao.new(o_cotacao_params)

    if @o_cotacao.save
      redirect_to o_cotacoes_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @o_cotacao.update(o_cotacao_params)
      redirect_to o_cotacoes_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_cotacao.destroy
      redirect_to o_cotacoes_url, notice: t('messages.deleted_successfully')
    else
      redirect_to o_cotacoes_url, alert: t('messages.delete_failed_due_to_dependencies')
    end
  end

  # ============================
  # Ação para fornecedor enviar proposta
  def propostas_enviar
    fornecedor = current_user.f_empresa_fornecedora

    # Trazer todas as cotações visíveis
    @o_cotacoes = OCotacao
                  .includes(:o_solicitacao, o_propostas: :o_status)
                  .order(created_at: :desc)

    # Ransack para filtro de pesquisa
    @q = OCotacao.ransack(params[:q])
    @o_cotacoes = @q.result(distinct: true)

    # Paginação
    @pagy, @o_cotacoes = pagy(@o_cotacoes)
  end

  private

  def set_o_cotacao
    @o_cotacao = OCotacao.find_by(id: params[:id])
    redirect_to o_cotacoes_path, alert: t('messages.not_found') unless @o_cotacao
  end

  def o_cotacao_params
    permitted_attributes = OCotacao.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:o_cotacao).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to o_cotacoes_path, alert: t('messages.not_found')
  end
end
