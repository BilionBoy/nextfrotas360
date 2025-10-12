# frozen_string_literal: true

class OOrdemServico < ApplicationRecord
  # Associações
  belongs_to :o_proposta
  belongs_to :f_empresa_fornecedora
  belongs_to :g_veiculo
  belongs_to :o_status
  belongs_to :validado_por, class_name: 'User', optional: true
  # Validações
  validates :numero_os, presence: true, uniqueness: true
  validates :o_proposta, :f_empresa_fornecedora, :g_veiculo, :o_status, presence: true

  # Callbacks
  before_validation :gerar_numero_os, on: :create

  # Métodos
  def gerar_numero_os
    self.numero_os ||= "OS#{Time.current.strftime('%Y%m%d')}#{SecureRandom.hex(3).upcase}"
  end

  def aprovar!(usuario)
    self.validado_por = usuario
    self.validado_em = Time.current
    self.o_status = OStatus.find_by(descricao: 'Aprovada')
    save!
  end

  def adicionar_item_executado(item)
    self.itens_executados ||= []
    self.itens_executados << item
    save!
  end

  def custo_real
    itens = itens_executados.presence || itens_previstos.presence
    return 0 unless itens

    itens.sum do |item|
     quantidade = item['quantidade'].to_f
     valor_unitario = item['valor_unitario'].to_f
     quantidade * valor_unitario
   end
  end
end
