# frozen_string_literal: true
class GStatusController < ApplicationController
  before_action :set_g_status, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = GStatus.ransack(params[:q])
    @pagy, @g_status = pagy(@q.result)
  end

  def new
    @g_status = GStatus.new
  end

  def edit
  end

  def create
    @g_status = GStatus.new(g_status_params)

    if @g_status.save
      redirect_to g_status_index_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_status.update(g_status_params)
      redirect_to g_status_index_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_status.destroy
      redirect_to g_status_url, notice: t('messages.deleted_successfully')
    else
      redirect_to g_status_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_g_status
    @g_status = GStatus.find_by(id: params[:id])
    return redirect_to g_status_index_path, alert: t('messages.not_found') unless @g_status
  end

  def g_status_params
    permitted_attributes = GStatus.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:g_status).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to g_status_index_path, alert: t('messages.not_found')
  end
end
