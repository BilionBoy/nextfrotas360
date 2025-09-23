# frozen_string_literal: true
class APapeisController < ApplicationController
  before_action :set_a_papel, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = APapel.ransack(params[:q])
    @pagy, @a_papeis = pagy(@q.result)
  end

  def new
    @a_papel = APapel.new
  end

  def edit
  end

  def create
    @a_papel = APapel.new(a_papel_params)

    if @a_papel.save
      redirect_to a_papeis_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @a_papel.update(a_papel_params)
      redirect_to a_papeis_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @a_papel.destroy
      redirect_to a_papeis_url, notice: t('messages.deleted_successfully')
    else
      redirect_to a_papeis_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_a_papel
    @a_papel = APapel.find_by(id: params[:id])
    return redirect_to a_papeis_path, alert: t('messages.not_found') unless @a_papel
  end

  def a_papel_params
    permitted_attributes = APapel.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:a_papel).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to a_papeis_path, alert: t('messages.not_found')
  end
end
