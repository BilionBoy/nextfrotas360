# frozen_string_literal: true
class GCategoriasCarteirasCondutoresController < ApplicationController
  before_action :set_g_categoria_carteira_condutor, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = GCategoriaCarteiraCondutor.ransack(params[:q])
    @pagy, @g_categorias_carteiras_condutores = pagy(@q.result)
  end

  def new
    @g_categoria_carteira_condutor = GCategoriaCarteiraCondutor.new
  end

  def edit
  end

  def create
    @g_categoria_carteira_condutor = GCategoriaCarteiraCondutor.new(g_categoria_carteira_condutor_params)

    if @g_categoria_carteira_condutor.save
      redirect_to g_categorias_carteiras_condutores_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_categoria_carteira_condutor.update(g_categoria_carteira_condutor_params)
      redirect_to g_categorias_carteiras_condutores_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_categoria_carteira_condutor.destroy
      redirect_to g_categorias_carteiras_condutores_url, notice: t('messages.deleted_successfully')
    else
      redirect_to g_categorias_carteiras_condutores_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_g_categoria_carteira_condutor
    @g_categoria_carteira_condutor = GCategoriaCarteiraCondutor.find_by(id: params[:id])
    return redirect_to g_categorias_carteiras_condutores_path, alert: t('messages.not_found') unless @g_categoria_carteira_condutor
  end

  def g_categoria_carteira_condutor_params
    permitted_attributes = GCategoriaCarteiraCondutor.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:g_categoria_carteira_condutor).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to g_categorias_carteiras_condutores_path, alert: t('messages.not_found')
  end
end
