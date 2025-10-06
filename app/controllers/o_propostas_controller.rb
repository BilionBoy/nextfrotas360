# frozen_string_literal: true
class OPropostasController < ApplicationController
  before_action :set_o_proposta, only: %i[show edit update destroy aprovar recusar]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OProposta.ransack(params[:q])
    @pagy, @o_propostas = pagy(@q.result)
  end

  def new
    @o_proposta = OProposta.new
    @o_proposta.o_proposta_itens.build  # garante que fields_for existam
  end

  def edit
    @o_proposta.gerar_itens_padrao!
    @o_proposta.o_proposta_itens.build if @o_proposta.o_proposta_itens.empty?
  end

  def create
    unless current_user.f_empresa_fornecedora
      redirect_to o_propostas_path, alert: "Apenas usuários fornecedores podem enviar propostas."
      return
    end

    @o_proposta = OProposta.new(o_proposta_params)
    @o_proposta.f_empresa_fornecedora = current_user.f_empresa_fornecedora
    @o_proposta.usuario_envio = current_user
    @o_proposta.o_status = OStatus.find_by(descricao: "Pendente")

    if @o_proposta.save
      @o_proposta.gerar_itens_padrao!  # se houver itens na cotação, serão gerados
      redirect_to new_o_proposta_o_proposta_item_path(@o_proposta), notice: "Proposta criada! Agora você pode adicionar itens."
    else
      @o_proposta.o_proposta_itens.build if @o_proposta.o_proposta_itens.empty?
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @o_proposta.o_proposta_itens.build if @o_proposta.o_proposta_itens.empty?

    if @o_proposta.update(o_proposta_params)
      redirect_to o_propostas_path, notice: "Proposta atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_proposta.destroy
      redirect_to o_propostas_url, notice: "Proposta deletada com sucesso."
    else
      redirect_to o_propostas_url, alert: "Falha ao deletar proposta."
    end
  end

  def fornecedor_enviadas
    fornecedor = current_user.f_empresa_fornecedora
    @o_propostas = OProposta.where(f_empresa_fornecedora: fornecedor)
                             .where(o_status: OStatus.where(descricao: ['Pendente', 'Enviada', 'Aprovada']))
                             .order(created_at: :desc)
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
    @o_proposta.recusar!(current_user)
    redirect_to o_propostas_path, notice: "Proposta recusada com sucesso."
  rescue => e
    redirect_to o_propostas_path, alert: "Falha ao recusar proposta: #{e.message}"
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
    redirect_to o_propostas_path, alert: "Registro não encontrado"
  end

  def authorize_gestor!
    redirect_to o_propostas_path, alert: "Acesso negado" unless current_user.gestor?
  end
end
