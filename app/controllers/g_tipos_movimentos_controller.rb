# frozen_string_literal: true
class GTiposMovimentosController < ApplicationController
  before_action :set_g_tipo_movimento, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = GTipoMovimento.ransack(params[:q])
    @pagy, @g_tipos_movimentos = pagy(@q.result)
  end

  def new
    @g_tipo_movimento = GTipoMovimento.new
  end

  def edit
  end

  def create
   @g_tipo_movimento = GTipoMovimento.new(g_tipo_movimento_params)

   if @g_tipo_movimento.save
     redirect_to g_tipos_movimentos_path, notice: t('messages.created_successfully')
   else
     render :new, status: :unprocessable_entity
   end
  end

  def update
    if @g_tipo_movimento.update(g_tipo_movimento_params)
      redirect_to g_tipos_movimentos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_tipo_movimento.destroy
      redirect_to g_tipos_movimentos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to g_tipos_movimentos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_g_tipo_movimento
    @g_tipo_movimento = GTipoMovimento.find_by(id: params[:id])
    return redirect_to g_tipos_movimentos_path, alert: t('messages.not_found') unless @g_tipo_movimento
  end

  def g_tipo_movimento_params
    permitted_attributes = GTipoMovimento.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:g_tipo_movimento).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to g_tipos_movimentos_path, alert: t('messages.not_found')
  end
end
