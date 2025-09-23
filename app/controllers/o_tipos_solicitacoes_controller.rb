# frozen_string_literal: true
class OTiposSolicitacoesController < ApplicationController
  before_action :set_o_tipo_solicitacao, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OTipoSolicitacao.ransack(params[:q])
    @pagy, @o_tipos_solicitacoes = pagy(@q.result)
  end

  def new
    @o_tipo_solicitacao = OTipoSolicitacao.new
  end

  def edit
  end

  def create
    @o_tipo_solicitacao = OTipoSolicitacao.new(o_tipo_solicitacao_params)

    if @o_tipo_solicitacao.save
      redirect_to o_tipos_solicitacoes_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @o_tipo_solicitacao.update(o_tipo_solicitacao_params)
      redirect_to o_tipos_solicitacoes_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_tipo_solicitacao.destroy
      redirect_to o_tipos_solicitacoes_url, notice: t('messages.deleted_successfully')
    else
      redirect_to o_tipos_solicitacoes_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_o_tipo_solicitacao
    @o_tipo_solicitacao = OTipoSolicitacao.find_by(id: params[:id])
    return redirect_to o_tipos_solicitacoes_path, alert: t('messages.not_found') unless @o_tipo_solicitacao
  end

  def o_tipo_solicitacao_params
    permitted_attributes = OTipoSolicitacao.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:o_tipo_solicitacao).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to o_tipos_solicitacoes_path, alert: t('messages.not_found')
  end
end
