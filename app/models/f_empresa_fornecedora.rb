# frozen_string_literal: true

class FEmpresaFornecedora < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :a_status
  belongs_to :g_municipio
  has_many   :t_taxas_empresas_fornecedoras, dependent: :destroy
  has_many   :t_taxas, through: :t_taxas_empresas_fornecedoras
  has_many   :f_empresas_servicos, dependent: :destroy
  
  validates :nome_fantasia, presence: true
  validates :razao_social, presence: true
end
