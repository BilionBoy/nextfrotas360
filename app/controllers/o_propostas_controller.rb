# frozen_string_literal: true
class OPropostasController < ApplicationController
  before_action :set_o_proposta, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OProposta.ransack(params[:q])
    @pagy, @o_propostas = pagy(@q.result)
  end

  def new
    @o_proposta = OProposta.new
  end

  def edit
  end

  def create
    unless current_user.f_empresa_fornecedora
      redirect_to o_propostas_path, alert: "Apenas usuários fornecedores podem enviar propostas."
      return
    end
  
    @o_proposta = OProposta.new(o_proposta_params)
    @o_proposta.f_empresa_fornecedora = current_user.f_empresa_fornecedora
    @o_proposta.usuario_envio = current_user
    @o_proposta.o_status = OStatus.find_by(descricao: "Pendente")
  
    if @o_proposta.save
      redirect_to @o_proposta, notice: "Proposta enviada com sucesso!"
    else
      Rails.logger.debug "Erros ao salvar OProposta: #{@o_proposta.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
  end
end

  def update
    if @o_proposta.update(o_proposta_params)
      redirect_to o_propostas_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_proposta.destroy
      redirect_to o_propostas_url, notice: t('messages.deleted_successfully')
    else
      redirect_to o_propostas_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_o_proposta
    @o_proposta = OProposta.find_by(id: params[:id])
    return redirect_to o_propostas_path, alert: t('messages.not_found') unless @o_proposta
  end

  def o_proposta_params
    permitted_attributes = OProposta.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:o_proposta).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to o_propostas_path, alert: t('messages.not_found')
  end
end
