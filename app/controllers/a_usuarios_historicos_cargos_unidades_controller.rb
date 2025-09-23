# frozen_string_literal: true
class AUsuariosHistoricosCargosUnidadesController < ApplicationController
  before_action :set_a_usuario_historico_cargo_unidade, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = AUsuarioHistoricoCargoUnidade.ransack(params[:q])
    @pagy, @a_usuarios_historicos_cargos_unidades = pagy(@q.result)
  end

  def new
    @a_usuario_historico_cargo_unidade = AUsuarioHistoricoCargoUnidade.new
  end

  def edit
  end

  def create
    @a_usuario_historico_cargo_unidade = AUsuarioHistoricoCargoUnidade.new(a_usuario_historico_cargo_unidade_params)

    if @a_usuario_historico_cargo_unidade.save
      redirect_to a_usuarios_historicos_cargos_unidades_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @a_usuario_historico_cargo_unidade.update(a_usuario_historico_cargo_unidade_params)
      redirect_to a_usuarios_historicos_cargos_unidades_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @a_usuario_historico_cargo_unidade.destroy
      redirect_to a_usuarios_historicos_cargos_unidades_url, notice: t('messages.deleted_successfully')
    else
      redirect_to a_usuarios_historicos_cargos_unidades_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_a_usuario_historico_cargo_unidade
    @a_usuario_historico_cargo_unidade = AUsuarioHistoricoCargoUnidade.find_by(id: params[:id])
    return redirect_to a_usuarios_historicos_cargos_unidades_path, alert: t('messages.not_found') unless @a_usuario_historico_cargo_unidade
  end

  def a_usuario_historico_cargo_unidade_params
    permitted_attributes = AUsuarioHistoricoCargoUnidade.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:a_usuario_historico_cargo_unidade).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to a_usuarios_historicos_cargos_unidades_path, alert: t('messages.not_found')
  end
end
