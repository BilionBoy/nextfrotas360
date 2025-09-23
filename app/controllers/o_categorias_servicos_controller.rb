# frozen_string_literal: true
class OCategoriasServicosController < ApplicationController
  before_action :set_o_categoria_servico, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OCategoriaServico.ransack(params[:q])
    @pagy, @o_categorias_servicos = pagy(@q.result)
  end

  def new
    @o_categoria_servico = OCategoriaServico.new
  end

  def edit
  end

  def create
    @o_categoria_servico = OCategoriaServico.new(o_categoria_servico_params)

    if @o_categoria_servico.save
      redirect_to o_categorias_servicos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @o_categoria_servico.update(o_categoria_servico_params)
      redirect_to o_categorias_servicos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_categoria_servico.destroy
      redirect_to o_categorias_servicos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to o_categorias_servicos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_o_categoria_servico
    @o_categoria_servico = OCategoriaServico.find_by(id: params[:id])
    return redirect_to o_categorias_servicos_path, alert: t('messages.not_found') unless @o_categoria_servico
  end

  def o_categoria_servico_params
    permitted_attributes = OCategoriaServico.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:o_categoria_servico).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to o_categorias_servicos_path, alert: t('messages.not_found')
  end
end
