# frozen_string_literal: true
class FFinanceirosController < ApplicationController
  before_action :set_f_financeiro, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = FFinanceiro.ransack(params[:q])
    @pagy, @f_financeiros = pagy(@q.result)
  end

  def new
    @f_financeiro = FFinanceiro.new
  end

  def edit
  end

  def create
    @f_financeiro = FFinanceiro.new(f_financeiro_params)

    if @f_financeiro.save
      redirect_to f_financeiros_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @f_financeiro.update(f_financeiro_params)
      redirect_to f_financeiros_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @f_financeiro.destroy
      redirect_to f_financeiros_url, notice: t('messages.deleted_successfully')
    else
      redirect_to f_financeiros_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_f_financeiro
    @f_financeiro = FFinanceiro.find_by(id: params[:id])
    return redirect_to f_financeiros_path, alert: t('messages.not_found') unless @f_financeiro
  end

  def f_financeiro_params
    permitted_attributes = FFinanceiro.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:f_financeiro).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to f_financeiros_path, alert: t('messages.not_found')
  end
end
