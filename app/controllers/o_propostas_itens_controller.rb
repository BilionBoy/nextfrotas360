# frozen_string_literal: true
class OPropostasItensController < ApplicationController
  before_action :set_o_proposta, only: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OPropostaItem.ransack(params[:q])
    @pagy, @o_propostas_itens = pagy(@q.result)
  end

  def new
    # Se não existir item para cada cotacao_item, cria
    @o_proposta.o_cotacao.o_cotacoes_itens.each do |ci|
      @o_proposta.o_proposta_itens.find_or_initialize_by(o_cotacao_item: ci)
    end
  end

  def create
    @o_proposta_item = @o_proposta.o_proposta_itens.find(params[:o_proposta_item][:id])
    @o_proposta_item.assign_attributes(o_proposta_item_params)
    @o_proposta_item.total_item = @o_proposta_item.quantidade * @o_proposta_item.valor_unitario

    if @o_proposta_item.save
      # Atualiza valor total da proposta
      @o_proposta.update(
        valor_total: @o_proposta.o_proposta_itens.sum("quantidade * valor_unitario")
      )

      # Próximo item
      proximo_item = @o_proposta.o_proposta_itens.where("id > ?", @o_proposta_item.id).first
      if proximo_item
        redirect_to new_o_proposta_item_path(o_proposta_id: @o_proposta.id)
      else
        redirect_to o_propostas_path, notice: "Proposta enviada com sucesso!"
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_o_proposta
    @o_proposta = OProposta.find(params[:o_proposta_id])
  end

  def o_proposta_item_params
    params.require(:o_proposta_item).permit(:valor_unitario, :observacao)
  end

  def handle_not_found
    redirect_to o_propostas_itens_path, alert: "Registro não encontrado"
  end
end
