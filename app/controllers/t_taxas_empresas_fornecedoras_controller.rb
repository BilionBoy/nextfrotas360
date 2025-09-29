class TTaxasEmpresasFornecedorasController < ApplicationController
  before_action :set_t_taxa_empresa_fornecedora, only: %i[show edit update destroy]

  def index
    @q = TTaxaEmpresaFornecedora.ransack(params[:q])
    @pagy, @t_taxas_empresas_fornecedoras = pagy(@q.result)
  end

  def new
    @t_taxa_empresa_fornecedora = TTaxaEmpresaFornecedora.new
    @t_taxa_empresa_fornecedora.f_empresa_fornecedora_id = params[:f_empresa_fornecedora_id] if params[:f_empresa_fornecedora_id].present?
  end

  def create
    @t_taxa_empresa_fornecedora = TTaxaEmpresaFornecedora.new(t_taxa_empresa_fornecedora_params)
    if @t_taxa_empresa_fornecedora.save
      redirect_to t_taxas_empresas_fornecedoras_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @t_taxa_empresa_fornecedora.update(t_taxa_empresa_fornecedora_params)
      redirect_to t_taxas_empresas_fornecedoras_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @t_taxa_empresa_fornecedora.destroy
      redirect_to t_taxas_empresas_fornecedoras_path, notice: t('messages.deleted_successfully')
    else
      redirect_to t_taxas_empresas_fornecedoras_path, alert: t('messages.delete_failed_due_to_dependencies')
    end
  end

  private

  def set_t_taxa_empresa_fornecedora
    @t_taxa_empresa_fornecedora = TTaxaEmpresaFornecedora.find_by(id: params[:id])
    redirect_to t_taxas_empresas_fornecedoras_path, alert: t('messages.not_found') unless @t_taxa_empresa_fornecedora
  end

  def t_taxa_empresa_fornecedora_params
    permitted_attributes = TTaxaEmpresaFornecedora.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:t_taxa_empresa_fornecedora).permit(permitted_attributes.map(&:to_sym))
  end
end
