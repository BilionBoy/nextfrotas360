# frozen_string_literal: true
class FEmpresasFornecedorasController < ApplicationController
  before_action :set_f_empresa_fornecedora, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = FEmpresaFornecedora.ransack(params[:q])
    @pagy, @f_empresas_fornecedoras = pagy(@q.result)
  end

  def new
    @f_empresa_fornecedora = FEmpresaFornecedora.new
  end

  def edit
  end

  def create
    @f_empresa_fornecedora = FEmpresaFornecedora.new(f_empresa_fornecedora_params)

    if @f_empresa_fornecedora.save
      redirect_to f_empresas_fornecedoras_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @f_empresa_fornecedora.update(f_empresa_fornecedora_params)
      redirect_to f_empresas_fornecedoras_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @f_empresa_fornecedora.destroy
      redirect_to f_empresas_fornecedoras_url, notice: t('messages.deleted_successfully')
    else
      redirect_to f_empresas_fornecedoras_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_f_empresa_fornecedora
    @f_empresa_fornecedora = FEmpresaFornecedora.find_by(id: params[:id])
    return redirect_to f_empresas_fornecedoras_path, alert: t('messages.not_found') unless @f_empresa_fornecedora
  end

  def f_empresa_fornecedora_params
    permitted_attributes = FEmpresaFornecedora.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:f_empresa_fornecedora).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to f_empresas_fornecedoras_path, alert: t('messages.not_found')
  end
end
