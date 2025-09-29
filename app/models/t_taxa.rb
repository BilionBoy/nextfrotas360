# frozen_string_literal: true

class TTaxa < ApplicationRecord
  belongs_to :a_status

  validates :nome,       presence: true
  validates :descricao,  presence: true
  validates :percentual, presence: true

  def nome_com_percentual
    "#{nome} - #{percentual.to_s.gsub('.', ',')}%"
  end
end
