# frozen_string_literal: true

class OTipoSolicitacao < ApplicationRecord
 self.table_name = 'o_tipos_solicitacoes'

  validates :descricao, presence: true
end
