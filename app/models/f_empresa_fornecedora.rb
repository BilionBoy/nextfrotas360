# frozen_string_literal: true

class FEmpresaFornecedora < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :a_status
  belongs_to :g_municipio

  validates :nome_fantasia, presence: true
  validates :razao_social, presence: true
end
