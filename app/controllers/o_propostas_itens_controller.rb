# frozen_string_literal: true
class OPropostasItensController < ApplicationController
  before_action :set_o_proposta_item, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OPropostaItem.ransack(params[:q])
    @pagy, @o_propostas_itens = pagy(@q.result)
  end

   def new
     @o_proposta = OProposta.find(params[:o_proposta_id])
     @o_proposta_item = @o_proposta.o_proposta_itens.build(
       o_cotacao_item_id: params[:o_cotacao_item_id]
     )
   end


  def edit
  end

  def create
    @o_proposta_item = OPropostaItem.new(o_proposta_item_params)

    if @o_proposta_item.save
      redirect_to o_propostas_itens_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @o_proposta_item.update(o_proposta_item_params)
      redirect_to o_propostas_itens_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_proposta_item.destroy
      redirect_to o_propostas_itens_url, notice: t('messages.deleted_successfully')
    else
      redirect_to o_propostas_itens_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_o_proposta_item
    @o_proposta_item = OPropostaItem.find_by(id: params[:id])
    return redirect_to o_propostas_itens_path, alert: t('messages.not_found') unless @o_proposta_item
  end

  def o_proposta_item_params
    permitted_attributes = OPropostaItem.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:o_proposta_item).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to o_propostas_itens_path, alert: t('messages.not_found')
  end
end
