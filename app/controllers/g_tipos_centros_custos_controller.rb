# frozen_string_literal: true
class GTiposCentrosCustosController < ApplicationController
  before_action :set_g_tipo_centro_custo, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = GTipoCentroCusto.ransack(params[:q])
    @pagy, @g_tipos_centros_custos = pagy(@q.result)
  end

  def new
    @g_tipo_centro_custo = GTipoCentroCusto.new
  end

  def edit
  end

  def create
    @g_tipo_centro_custo = GTipoCentroCusto.new(g_tipo_centro_custo_params)

    if @g_tipo_centro_custo.save
      redirect_to g_tipos_centros_custos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_tipo_centro_custo.update(g_tipo_centro_custo_params)
      redirect_to g_tipos_centros_custos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_tipo_centro_custo.destroy
      redirect_to g_tipos_centros_custos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to g_tipos_centros_custos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_g_tipo_centro_custo
    @g_tipo_centro_custo = GTipoCentroCusto.find_by(id: params[:id])
    return redirect_to g_tipos_centros_custos_path, alert: t('messages.not_found') unless @g_tipo_centro_custo
  end

  def g_tipo_centro_custo_params
    permitted_attributes = GTipoCentroCusto.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:g_tipo_centro_custo).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to g_tipos_centros_custos_path, alert: t('messages.not_found')
  end
end
