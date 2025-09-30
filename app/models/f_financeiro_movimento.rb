# frozen_string_literal: true
class FFinanceiroMovimento < ApplicationRecord
  belongs_to :f_financeiro
  belongs_to :g_tipo_movimento

  # Delegar nome_fantasia da empresa fornecedora diretamente
  delegate :f_empresa_fornecedora, to: :f_financeiro
end
