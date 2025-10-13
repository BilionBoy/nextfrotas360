# frozen_string_literal: true
class ONotasFiscaisController < ApplicationController
  before_action :set_o_nota_fiscal, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    # Somente OS concluídas e sem NF
    @q = OOrdemServico.joins("LEFT JOIN o_notas_fiscais ON o_notas_fiscais.o_ordem_servico_id = o_ordem_servicos.id")
                      .where(o_status_id: OStatus.find_by(descricao: "Concluída").id)
                      .where(o_notas_fiscais: { id: nil })
                      .ransack(params[:q])
  
    @pagy, @ordens_de_servico = pagy(@q.result.includes(:o_proposta, :g_veiculo, :f_empresa_fornecedora))
  end
  
 def new
  if params[:o_ordem_servico_id]
    @o_ordem_servico = OOrdemServico.find(params[:o_ordem_servico_id])
    @o_nota_fiscal = ONotaFiscal.new(
      o_ordem_servico: @o_ordem_servico,
      numero: "#{@o_ordem_servico.numero_os}-NF",
      valor_total: @o_ordem_servico.o_proposta&.valor_total
    )
  else
    @o_nota_fiscal = ONotaFiscal.new
  end
 end

  def edit
  end

  def create
    @o_nota_fiscal = ONotaFiscal.new(o_nota_fiscal_params)

    if @o_nota_fiscal.save
      redirect_to o_notas_fiscais_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @o_nota_fiscal.update(o_nota_fiscal_params)
      redirect_to o_notas_fiscais_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_nota_fiscal.destroy
      redirect_to o_notas_fiscais_url, notice: t('messages.deleted_successfully')
    else
      redirect_to o_notas_fiscais_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end



  # GET /o_notas_fiscais/relatorio
 def relatorio
   @notas_fiscais = ONotaFiscal
                      .includes(:o_ordem_servico, :o_status_nf)
                      .order(created_at: :desc)
 
   # Se o usuário for fornecedor, mostra só as NF da empresa dele
   if current_user.fornecedor?
     @notas_fiscais = @notas_fiscais
                       .joins(o_ordem_servico: :o_proposta)
                       .where(o_propostas: { f_empresa_fornecedora_id: current_user.f_empresa_fornecedora_id })
   end
 
   # Filtros opcionais (por OS, status, período)
   if params[:os_numero].present?
     @notas_fiscais = @notas_fiscais
                        .joins(:o_ordem_servico)
                        .where("o_ordem_servicos.numero_os ILIKE ?", "%#{params[:os_numero]}%")
   end
 
   if params[:status_nf].present?
     @notas_fiscais = @notas_fiscais.where(o_status_nf_id: params[:status_nf])
   end
 
   if params[:data_inicio].present?
     @notas_fiscais = @notas_fiscais.where("data_emissao >= ?", params[:data_inicio])
   end
 
   if params[:data_fim].present?
     @notas_fiscais = @notas_fiscais.where("data_emissao <= ?", params[:data_fim])
   end
 end

  
  private

  def set_o_nota_fiscal
    @o_nota_fiscal = ONotaFiscal.find_by(id: params[:id])
    return redirect_to o_notas_fiscais_path, alert: t('messages.not_found') unless @o_nota_fiscal
  end

  def o_nota_fiscal_params
    permitted_attributes = ONotaFiscal.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:o_nota_fiscal).permit(permitted_attributes.map(&:to_sym),:arquivo_pdf,:arquivo_xml)
  end

  def handle_not_found
    redirect_to o_notas_fiscais_path, alert: t('messages.not_found')
  end
end
