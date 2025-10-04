# frozen_string_literal: true
class OOrdemServicosController < ApplicationController
  before_action :set_o_ordem_servico, only: [:show]
  before_action :authorize_gestor!

  # GET /o_ordem_servicos
  def index
    @q = OOrdemServico.ransack(params[:q])
    @pagy, @o_ordem_servicos = pagy(@q.result.includes(:o_proposta, :f_empresa_fornecedora, :g_veiculo, :o_status).order(created_at: :desc))
  end

  # GET /o_ordem_servicos/:id
  def show
    # Já temos @o_ordem_servico setado no before_action
    # Podemos exibir os itens_previstos diretamente
    @itens_previstos = @o_ordem_servico.itens_previstos
  end

  private

  def set_o_ordem_servico
    @o_ordem_servico = OOrdemServico.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to o_ordem_servicos_path, alert: "Ordem de Serviço não encontrada"
  end

  def authorize_gestor!
    redirect_to root_path, alert: "Acesso negado" unless current_user.gestor?
  end
end
