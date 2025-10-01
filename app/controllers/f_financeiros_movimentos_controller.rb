# frozen_string_literal: true
class FFinanceirosMovimentosController < ApplicationController
  before_action :set_f_financeiro_movimento, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = FFinanceiroMovimento.ransack(params[:q])
    @pagy, @f_financeiros_movimentos = pagy(@q.result)
  end

  def new
    @f_financeiro_movimento = FFinanceiroMovimento.new
  end

  def edit
  end

  def create
    @f_financeiro_movimento = FFinanceiroMovimento.new(f_financeiro_movimento_params)

    if @f_financeiro_movimento.save
      redirect_to f_financeiros_movimentos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @f_financeiro_movimento.update(f_financeiro_movimento_params)
      redirect_to f_financeiros_movimentos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @f_financeiro_movimento.destroy
      redirect_to f_financeiros_movimentos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to f_financeiros_movimentos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_f_financeiro_movimento
    @f_financeiro_movimento = FFinanceiroMovimento.find_by(id: params[:id])
    return redirect_to f_financeiros_movimentos_path, alert: t('messages.not_found') unless @f_financeiro_movimento
  end

  def f_financeiro_movimento_params
    permitted_attributes = FFinanceiroMovimento.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:f_financeiro_movimento).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to f_financeiros_movimentos_path, alert: t('messages.not_found')
  end
end
