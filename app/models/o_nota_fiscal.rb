# frozen_string_literal: true

class ONotaFiscal < ApplicationRecord
  has_one_attached :arquivo_pdf
  has_one_attached :arquivo_xml
  belongs_to :o_ordem_servico
  belongs_to :o_status_nf, optional: true

  validates :numero,       presence: true
  validates :data_emissao, presence: true
  validates :valor_total,  presence: true
  
end
