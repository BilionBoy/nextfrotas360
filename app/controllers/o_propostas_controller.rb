# frozen_string_literal: true
class OPropostasController < ApplicationController
  # Carrega e autoriza todos os recursos via CanCan
  load_and_authorize_resource

  before_action :set_o_proposta, only: %i[show edit update destroy aprovar recusar]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: I18n.t('cancan.access_denied')
  end

  # -----------------------------
  # Ações abertas para gestores
  # -----------------------------
  def index
    # Apenas gestores
    if current_user.gestor?
      # Pega propostas cujas cotações pertencem a solicitações da unidade do gestor
      unidade_id = current_user.a_unidade_id
  
      @q = OProposta.joins(o_cotacao: :o_solicitacao)
                    .where(o_solicitacoes: { g_centro_custo_id: GCentroCusto.where(a_unidade_id: unidade_id) })
                    .ransack(params[:q])
  
      @pagy, @o_propostas = pagy(@q.result.distinct.order(created_at: :desc))
    else
      # Para outros perfis (fornecedor/admin)
      @q = OProposta.ransack(params[:q])
      @pagy, @o_propostas = pagy(@q.result.order(created_at: :desc))
    end
  end

  def aprovar
    authorize_gestor!
    @o_proposta.aprovar!(current_user)
    redirect_to o_propostas_path, notice: "Proposta aprovada e OS criada com sucesso."
  rescue => e
    redirect_to o_propostas_path, alert: "Falha ao aprovar proposta: #{e.message}"
  end

def recusar
  authorize_gestor!

  @o_proposta = OProposta.find_by(id: params[:id])

  if @o_proposta.nil?
    redirect_back(fallback_location: o_cotacoes_path, alert: "Proposta não encontrada") and return
  end

  begin
    @o_proposta.recusar!(current_user)
    redirect_back(fallback_location: o_cotacoes_path, notice: "Proposta rejeitada com sucesso")
  rescue ActiveRecord::RecordInvalid => e
    redirect_back(fallback_location: o_cotacoes_path, alert: "Erro ao rejeitar proposta: #{e.message}")
  end
end



  # -----------------------------
  # Ações para fornecedores
  # -----------------------------
  def new
    @o_proposta = OProposta.new
    @o_proposta.o_cotacao_id = params[:o_cotacao_id] if params[:o_cotacao_id].present?
    @o_proposta.o_proposta_itens.build
  end

  def create
    unless current_user.f_empresa_fornecedora
      redirect_to root_path, alert: "Apenas usuários fornecedores podem enviar propostas."
      return
    end

    @o_proposta = OProposta.new(o_proposta_params)
    @o_proposta.f_empresa_fornecedora = current_user.f_empresa_fornecedora
    @o_proposta.usuario_envio = current_user
    @o_proposta.o_status = OStatus.find_by(descricao: "Pendente")

    if @o_proposta.save
      @o_proposta.gerar_itens_padrao!
      redirect_to fornecedor_enviadas_o_propostas_path, notice: "Proposta criada com sucesso!"
    else
      @o_proposta.o_proposta_itens.build if @o_proposta.o_proposta_itens.empty?
      render :new, status: :unprocessable_entity
    end
  end

  def fornecedor_enviadas
    authorize! :fornecedor_enviadas, OProposta
  
    fornecedor = current_user.f_empresa_fornecedora
    return redirect_to root_path, alert: "Usuário sem empresa associada" unless fornecedor
  
    @o_propostas = OProposta
                    .where(f_empresa_fornecedora: fornecedor)
                    .where(o_status: OStatus.where(descricao: ['Pendente', 'Enviada', 'Aprovada', 'Rejeitada']))
                    .includes(:o_cotacao, :o_status)
                    .order(created_at: :desc)
  end
  def show
    # CanCan já faz a checagem via load_and_authorize_resource
  end

  def edit
    @o_proposta.gerar_itens_padrao!
    @o_proposta.o_proposta_itens.build if @o_proposta.o_proposta_itens.empty?
  end

  def update
    @o_proposta.o_proposta_itens.build if @o_proposta.o_proposta_itens.empty?

    if @o_proposta.update(o_proposta_params)
      redirect_to fornecedor_enviadas_o_propostas_path, notice: "Proposta atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_proposta.destroy
      redirect_to fornecedor_enviadas_o_propostas_path, notice: "Proposta deletada com sucesso."
    else
      redirect_to fornecedor_enviadas_o_propostas_path, alert: "Falha ao deletar proposta."
    end
  end

  private

  def set_o_proposta
    @o_proposta = OProposta.find(params[:id])
  end

  def o_proposta_params
    params.fetch(:o_proposta, {}).permit(
      :o_cotacao_id,
      :valor_total,
      :prazo_execucao_dias,
      :validade_proposta,
      o_proposta_itens_attributes: [:id, :o_cotacao_item_id, :quantidade, :valor_unitario, :observacao, :_destroy]
    )
  end

  def handle_not_found
    redirect_to root_path, alert: "Registro não encontrado"
  end

  def authorize_gestor!
    redirect_to root_path, alert: "Acesso negado" unless current_user.gestor?
  end
end
