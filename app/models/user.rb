# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  belongs_to :a_cargo
  belongs_to :a_unidade
  belongs_to :a_tipo_usuario
  belongs_to :a_status
  has_many :a_usuarios_papeis

  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true
  validates :telefone, presence: true
  validates :cpf, presence: true, uniqueness: true
  
        
end
