# frozen_string_literal: true

class OCategoriaServico < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  has_many :f_empresas_servicos, dependent: :destroy
  has_many :f_empresa_fornecedoras, through: :f_empresas_servicos
  
  validates :descricao, presence: true

end
