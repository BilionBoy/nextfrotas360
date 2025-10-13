# frozen_string_literal: true

class ONotaFiscal < ApplicationRecord
  belongs_to :o_ordem_servico
  belongs_to :o_status_nf, optional: true

  validates :numero,       presence: true
  validates :data_emissao, presence: true
  validates :valor_total,  presence: true
  
end
