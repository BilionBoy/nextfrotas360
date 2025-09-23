# frozen_string_literal: true

class AUnidade < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :a_tipo_unidade
  belongs_to :a_status
  belongs_to :g_municipio

  validates :nome_fantasia, presence: true
  validates :telefone, presence: true
  validates :codigo_interno, presence: true, uniqueness: true
  validates :cnpj, uniqueness: true, allow_blank: true
  validates :endereco, presence: true

end
