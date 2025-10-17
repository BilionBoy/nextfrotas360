# frozen_string_literal: true
class OCotacoesController < ApplicationController
  before_action :set_o_cotacao, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  def index
    if current_user.gestor?
      unidade_id = current_user.a_unidade_id
  
      @q = OCotacao.joins(o_solicitacao: :g_centro_custo)
                   .where(g_centros_custos: { a_unidade_id: unidade_id })
                   .ransack(params[:q])
    else
      @q = OCotacao.ransack(params[:q])
    end
  
    @pagy, @o_cotacoes = pagy(@q.result.includes(:o_solicitacao, :o_status).distinct)
  end


  def new
    @o_cotacao = OCotacao.new
    @o_cotacao.o_solicitacao_id = params[:solicitacao_id] if params[:solicitacao_id].present?
  end

  def edit; 
    if current_user.gestor? && @o_cotacao.o_solicitacao.g_centro_custo.a_unidade_id != current_user.a_unidade_id
      redirect_to o_cotacoes_path, alert: "Acesso negado"
    end
  end

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
 # ============================
# Ação para fornecedor enviar proposta
def propostas_enviar
  fornecedor = current_user.f_empresa_fornecedora
  return redirect_to root_path, alert: "Usuário sem empresa associada" unless fornecedor

  # Filtra cotações de solicitações do mesmo município do fornecedor
  @q = OCotacao
         .joins(o_solicitacao: { g_centro_custo: { a_unidade: :g_municipio } })
         .where(a_unidades: { g_municipio_id: fornecedor.g_municipio_id })
         .ransack(params[:q])

  @o_cotacoes = @q.result(distinct: true)
                  .includes(:o_solicitacao, o_propostas: :o_status)
                  .order(created_at: :desc)

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
