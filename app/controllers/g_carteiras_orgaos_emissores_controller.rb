# frozen_string_literal: true
class GCarteirasOrgaosEmissoresController < ApplicationController
  before_action :set_g_carteira_orgao_emissor, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = GCarteiraOrgaoEmissor.ransack(params[:q])
    @pagy, @g_carteiras_orgaos_emissores = pagy(@q.result)
  end

  def new
    @g_carteira_orgao_emissor = GCarteiraOrgaoEmissor.new
  end

  def edit
  end

  def create
    @g_carteira_orgao_emissor = GCarteiraOrgaoEmissor.new(g_carteira_orgao_emissor_params)

    if @g_carteira_orgao_emissor.save
      redirect_to g_carteiras_orgaos_emissores_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_carteira_orgao_emissor.update(g_carteira_orgao_emissor_params)
      redirect_to g_carteiras_orgaos_emissores_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_carteira_orgao_emissor.destroy
      redirect_to g_carteiras_orgaos_emissores_url, notice: t('messages.deleted_successfully')
    else
      redirect_to g_carteiras_orgaos_emissores_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_g_carteira_orgao_emissor
    @g_carteira_orgao_emissor = GCarteiraOrgaoEmissor.find_by(id: params[:id])
    return redirect_to g_carteiras_orgaos_emissores_path, alert: t('messages.not_found') unless @g_carteira_orgao_emissor
  end

  def g_carteira_orgao_emissor_params
    permitted_attributes = GCarteiraOrgaoEmissor.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:g_carteira_orgao_emissor).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to g_carteiras_orgaos_emissores_path, alert: t('messages.not_found')
  end
end
