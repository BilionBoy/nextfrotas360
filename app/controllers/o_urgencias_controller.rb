# frozen_string_literal: true
class OUrgenciasController < ApplicationController
  before_action :set_o_urgencia, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OUrgencia.ransack(params[:q])
    @pagy, @o_urgencias = pagy(@q.result)
  end

  def new
    @o_urgencia = OUrgencia.new
  end

  def edit
  end

  def create
    @o_urgencia = OUrgencia.new(o_urgencia_params)

    if @o_urgencia.save
      redirect_to o_urgencias_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @o_urgencia.update(o_urgencia_params)
      redirect_to o_urgencias_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_urgencia.destroy
      redirect_to o_urgencias_url, notice: t('messages.deleted_successfully')
    else
      redirect_to o_urgencias_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_o_urgencia
    @o_urgencia = OUrgencia.find_by(id: params[:id])
    return redirect_to o_urgencias_path, alert: t('messages.not_found') unless @o_urgencia
  end

  def o_urgencia_params
    permitted_attributes = OUrgencia.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:o_urgencia).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to o_urgencias_path, alert: t('messages.not_found')
  end
end
