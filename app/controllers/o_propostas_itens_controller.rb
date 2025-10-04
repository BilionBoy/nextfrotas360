# frozen_string_literal: true
class OPropostasItensController < ApplicationController
  before_action :set_o_proposta

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OPropostaItem.ransack(params[:q])
    @pagy, @o_propostas_itens = pagy(@q.result)
  end

  def new
    # Inicializa itens padrão se ainda não existirem
    @o_proposta.o_cotacao.o_cotacoes_itens.each do |ci|
      @o_proposta.o_proposta_itens.find_or_initialize_by(o_cotacao_item: ci)
    end
  end

  def create
    success = true

    @o_proposta.o_proposta_itens.each do |item|
      attrs = params[:o_proposta][:o_proposta_itens_attributes].detect { |_, v| v[:id].to_i == item.id }&.last
      next unless attrs

      item.assign_attributes(valor_unitario: attrs[:valor_unitario], observacao: attrs[:observacao])
      item.total_item = (item.quantidade || 0) * (item.valor_unitario || 0)
      success &&= item.save
    end

    if success
      # Atualiza valor total da proposta
      @o_proposta.update(valor_total: @o_proposta.o_proposta_itens.sum("quantidade * valor_unitario"))
      redirect_to o_propostas_path, notice: "Proposta enviada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_o_proposta
    @o_proposta = OProposta.find(params[:o_proposta_id])
  end

  def handle_not_found
    redirect_to o_propostas_path, alert: "Registro não encontrado"
  end
end
