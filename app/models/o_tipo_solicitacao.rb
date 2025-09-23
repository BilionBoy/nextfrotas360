# frozen_string_literal: true

class OTipoSolicitacao < ApplicationRecord
  validates :descricao, presence: true
end
