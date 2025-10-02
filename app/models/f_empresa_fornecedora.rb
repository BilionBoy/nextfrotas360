  # CORREÇÃO: cada fornecedor tem muitos financeiros
class FEmpresaFornecedora < ApplicationRecord
  belongs_to :a_status
  belongs_to :g_municipio
  has_many :t_taxas_empresas_fornecedoras, dependent: :destroy
  has_many :t_taxas, through: :t_taxas_empresas_fornecedoras
  has_many :f_empresas_servicos, dependent: :destroy
  has_many :f_financeiros, dependent: :destroy

  validates :nome_fantasia, presence: true
  validates :razao_social, presence: true
end
