# frozen_string_literal: true
class FEmpresasServicosController < ApplicationController
  before_action :set_f_empresa_servico, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = FEmpresaServico.ransack(params[:q])
    @pagy, @f_empresas_servicos = pagy(@q.result)
  end

  def new
    @f_empresa_servico = FEmpresaServico.new
  end

  def edit
  end

  def create
    @f_empresa_servico = FEmpresaServico.new(f_empresa_servico_params)

    if @f_empresa_servico.save
      redirect_to f_empresas_servicos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @f_empresa_servico.update(f_empresa_servico_params)
      redirect_to f_empresas_servicos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @f_empresa_servico.destroy
      redirect_to f_empresas_servicos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to f_empresas_servicos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_f_empresa_servico
    @f_empresa_servico = FEmpresaServico.find_by(id: params[:id])
    return redirect_to f_empresas_servicos_path, alert: t('messages.not_found') unless @f_empresa_servico
  end

  def f_empresa_servico_params
    permitted_attributes = FEmpresaServico.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:f_empresa_servico).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to f_empresas_servicos_path, alert: t('messages.not_found')
  end
end
