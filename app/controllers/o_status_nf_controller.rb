# frozen_string_literal: true
class OStatusNfController < ApplicationController
  before_action :set_o_status_nf, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OStatusNf.ransack(params[:q])
    @pagy, @o_status_nf = pagy(@q.result)
  end

  def new
    @o_status_nf = OStatusNf.new
  end

  def edit
  end

  def create
    @o_status_nf = OStatusNf.new(o_status_nf_params)

    if @o_status_nf.save
      redirect_to o_status_nf_index_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @o_status_nf.update(o_status_nf_params)
      redirect_to o_status_nf_index_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_status_nf.destroy
      redirect_to o_status_nf_url, notice: t('messages.deleted_successfully')
    else
      redirect_to o_status_nf_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_o_status_nf
    @o_status_nf = OStatusNf.find_by(id: params[:id])
    return redirect_to o_status_nf_index_path, alert: t('messages.not_found') unless @o_status_nf
  end

  def o_status_nf_params
    permitted_attributes = OStatusNf.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:o_status_nf).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to o_status_nf_index_path, alert: t('messages.not_found')
  end
end
