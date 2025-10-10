# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  belongs_to         :a_cargo
  belongs_to         :a_unidade, optional: true
  belongs_to         :a_tipo_usuario
  belongs_to         :a_status
  belongs_to         :f_empresa_fornecedora, optional: true
  has_many           :a_usuarios_papeis
  has_one_attached   :foto_perfil
  has_one_attached   :foto_rg


  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true

  # Helpers para tipos de usuário
  def admin?
    a_tipo_usuario&.descricao&.downcase == "admin"
  end

  def gestor?
    a_tipo_usuario&.descricao&.downcase == "gestor"
  end

  def fornecedor?
    a_tipo_usuario&.descricao&.downcase == "fornecedor"
  end

end
