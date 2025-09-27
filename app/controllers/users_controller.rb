class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy remove_foto_perfil remove_foto_rg]
  before_action :verify_admin_or_gestor, only: %i[index new create destroy new_gestor new_fornecedor create_gestor create_fornecedor]
  before_action :verify_access, only: %i[edit update]
  load_and_authorize_resource

  def index
    @q = User.ransack(params[:q])
    @pagy, @users = pagy(@q.result)
  end

  # Formulários
  def new
    @user = User.new
    prefill_fields_for_current_user
  end

  def new_gestor
    @user = User.new(a_tipo_usuario_id: tipo_gestor_id)
    prefill_fields_for_current_user
    render :new
  end

  def new_fornecedor
    @user = User.new(a_tipo_usuario_id: tipo_fornecedor_id)
    prefill_fields_for_current_user
    render :new
  end

  # Criação
  def create
    @user = User.new(user_params)
    prefill_fields_for_current_user
    salvar_usuario
  end

  def create_gestor
    @user = User.new(user_params.merge(a_tipo_usuario_id: tipo_gestor_id))
    prefill_fields_for_current_user
    salvar_usuario
  end

  def create_fornecedor
    @user = User.new(user_params.merge(a_tipo_usuario_id: tipo_fornecedor_id))
    prefill_fields_for_current_user
    salvar_usuario
  end

  # Edit/Update
  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Destroy
  def destroy
    if @user.destroy
      redirect_to users_path, notice: "Registro foi marcado como excluído."
    else
      redirect_to users_path, alert: "Ainda existem dependentes desse registro."
    end
  end

  # Remover fotos
  def remove_foto_perfil
    @user.foto_perfil.purge
    redirect_back fallback_location: edit_user_path(@user), notice: "Foto de perfil removida."
  end

  def remove_foto_rg
    @user.foto_rg.purge
    redirect_back fallback_location: edit_user_path(@user), notice: "Foto do RG removida."
  end

  private

  def verify_admin_or_gestor
    redirect_to(root_path, alert: I18n.t("errors.not_authorized")) unless current_user.admin? || current_user.gestor?
  end

  def verify_access
    redirect_to(root_path, alert: I18n.t("errors.not_authorized")) unless current_user.admin? || current_user == @user
  end

  def set_user
    @user = User.find_by_id(params[:id])
    redirect_to(root_path, alert: I18n.t("errors.user_not_found")) unless @user
  end

  def tipo_gestor_id
    ATipoUsuario.find_by(nome: "Gestor")&.id
  end

  def tipo_fornecedor_id
    ATipoUsuario.find_by(nome: "Fornecedor")&.id
  end

  def prefill_fields_for_current_user
    @user.a_unidade = current_user.a_unidade if current_user.gestor?
    @user.f_empresa_fornecedora = current_user.f_empresa_fornecedora if current_user.fornecedor?
  end

  def salvar_usuario
    if @user.save
      redirect_to users_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def user_params
    permitted = [
      :email, :cpf, :nome, :telefone, :a_tipo_usuario_id,
      :a_unidade_id, :f_empresa_fornecedora_id, :a_cargo_id, :a_status_id,
      :password, :password_confirmation, :foto_perfil, :foto_rg
    ]
    params.require(:user).permit(permitted)
  end
end
