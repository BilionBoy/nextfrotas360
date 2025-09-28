# frozen_string_literal: true
class TTaxasEmpresasFornecedorasController < ApplicationController
  before_action :set_t_taxa_empresa_fornecedora, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = TTaxaEmpresaFornecedora.ransack(params[:q])
    @pagy, @t_taxas_empresas_fornecedoras = pagy(@q.result)
  end

  def new
    @t_taxa_empresa_fornecedora = TTaxaEmpresaFornecedora.new
  end

  def edit
  end

  def create
    @t_taxa_empresa_fornecedora = TTaxaEmpresaFornecedora.new(t_taxa_empresa_fornecedora_params)

    if @t_taxa_empresa_fornecedora.save
      redirect_to t_taxas_empresas_fornecedoras_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @t_taxa_empresa_fornecedora.update(t_taxa_empresa_fornecedora_params)
      redirect_to t_taxas_empresas_fornecedoras_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @t_taxa_empresa_fornecedora.destroy
      redirect_to t_taxas_empresas_fornecedoras_url, notice: t('messages.deleted_successfully')
    else
      redirect_to t_taxas_empresas_fornecedoras_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_t_taxa_empresa_fornecedora
    @t_taxa_empresa_fornecedora = TTaxaEmpresaFornecedora.find_by(id: params[:id])
    return redirect_to t_taxas_empresas_fornecedoras_path, alert: t('messages.not_found') unless @t_taxa_empresa_fornecedora
  end

  def t_taxa_empresa_fornecedora_params
    permitted_attributes = TTaxaEmpresaFornecedora.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:t_taxa_empresa_fornecedora).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to t_taxas_empresas_fornecedoras_path, alert: t('messages.not_found')
  end
end
