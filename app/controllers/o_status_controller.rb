# frozen_string_literal: true
class OStatusController < ApplicationController
  before_action :set_o_status, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OStatus.ransack(params[:q])
    @pagy, @o_status = pagy(@q.result)
  end

  def new
    @o_status = OStatus.new
  end

  def edit
  end

  def create
    @o_status = OStatus.new(o_status_params)

    if @o_status.save
      redirect_to o_status_index_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @o_status.update(o_status_params)
      redirect_to o_status_index_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_status.destroy
      redirect_to o_status_url, notice: t('messages.deleted_successfully')
    else
      redirect_to o_status_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_o_status
    @o_status = OStatus.find_by(id: params[:id])
    return redirect_to o_status_index_path, alert: t('messages.not_found') unless @o_status
  end

  def o_status_params
    permitted_attributes = OStatus.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:o_status).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to o_status_index_path, alert: t('messages.not_found')
  end
end
