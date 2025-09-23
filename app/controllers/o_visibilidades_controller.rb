# frozen_string_literal: true
class OVisibilidadesController < ApplicationController
  before_action :set_o_visibilidade, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OVisibilidade.ransack(params[:q])
    @pagy, @o_visibilidades = pagy(@q.result)
  end

  def new
    @o_visibilidade = OVisibilidade.new
  end

  def edit
  end

  def create
    @o_visibilidade = OVisibilidade.new(o_visibilidade_params)

    if @o_visibilidade.save
      redirect_to o_visibilidades_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @o_visibilidade.update(o_visibilidade_params)
      redirect_to o_visibilidades_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_visibilidade.destroy
      redirect_to o_visibilidades_url, notice: t('messages.deleted_successfully')
    else
      redirect_to o_visibilidades_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_o_visibilidade
    @o_visibilidade = OVisibilidade.find_by(id: params[:id])
    return redirect_to o_visibilidades_path, alert: t('messages.not_found') unless @o_visibilidade
  end

  def o_visibilidade_params
    permitted_attributes = OVisibilidade.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:o_visibilidade).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to o_visibilidades_path, alert: t('messages.not_found')
  end
end
