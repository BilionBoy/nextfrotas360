# frozen_string_literal: true
class OCotacoesItensController < ApplicationController
  before_action :set_o_cotacao_item, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OCotacaoItem.ransack(params[:q])
    @pagy, @o_cotacoes_itens = pagy(@q.result)
  end

 def new
    @o_cotacao = OCotacao.find(params[:o_cotacao_id])
    @o_cotacao_item = @o_cotacao.o_cotacoes_itens.build(
    descricao: @o_cotacao.o_solicitacao.descricao
  )
  end
  def edit
  end

  def create
    @o_cotacao_item = OCotacaoItem.new(o_cotacao_item_params)

    if @o_cotacao_item.save
      redirect_to o_cotacoes_itens_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @o_cotacao_item.update(o_cotacao_item_params)
      redirect_to o_cotacoes_itens_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_cotacao_item.destroy
      redirect_to o_cotacoes_itens_url, notice: t('messages.deleted_successfully')
    else
      redirect_to o_cotacoes_itens_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_o_cotacao_item
    @o_cotacao_item = OCotacaoItem.find_by(id: params[:id])
    return redirect_to o_cotacoes_itens_path, alert: t('messages.not_found') unless @o_cotacao_item
  end

  def o_cotacao_item_params
    permitted_attributes = OCotacaoItem.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:o_cotacao_item).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to o_cotacoes_itens_path, alert: t('messages.not_found')
  end
end
