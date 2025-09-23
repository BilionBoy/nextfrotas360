# frozen_string_literal: true
class APapeisPermissoesController < ApplicationController
  before_action :set_a_papel_permissao, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = APapelPermissao.ransack(params[:q])
    @pagy, @a_papeis_permissoes = pagy(@q.result)
  end

  def new
    @a_papel_permissao = APapelPermissao.new
  end

  def edit
  end

  def create
    @a_papel_permissao = APapelPermissao.new(a_papel_permissao_params)

    if @a_papel_permissao.save
      redirect_to a_papeis_permissoes_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @a_papel_permissao.update(a_papel_permissao_params)
      redirect_to a_papeis_permissoes_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @a_papel_permissao.destroy
      redirect_to a_papeis_permissoes_url, notice: t('messages.deleted_successfully')
    else
      redirect_to a_papeis_permissoes_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_a_papel_permissao
    @a_papel_permissao = APapelPermissao.find_by(id: params[:id])
    return redirect_to a_papeis_permissoes_path, alert: t('messages.not_found') unless @a_papel_permissao
  end

  def a_papel_permissao_params
    permitted_attributes = APapelPermissao.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:a_papel_permissao).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to a_papeis_permissoes_path, alert: t('messages.not_found')
  end
end
