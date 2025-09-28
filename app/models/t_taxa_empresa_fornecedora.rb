# frozen_string_literal: true

class TTaxaEmpresaFornecedora < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
    belongs_to :t_taxa  # assumindo que a tabela existe
  belongs_to :f_empresa_fornecedora  # assumindo que a tabela existe

end
