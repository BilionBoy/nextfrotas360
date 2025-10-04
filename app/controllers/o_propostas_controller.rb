# frozen_string_literal: true
class OPropostasController < ApplicationController
  before_action :set_o_proposta, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OProposta.ransack(params[:q])
    @pagy, @o_propostas = pagy(@q.result)
  end

  def new
    @o_proposta = OProposta.new
  end

  def edit
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
      # Gera itens padrao
      @o_proposta.gerar_itens_padrao!
      @o_proposta.save # salva os itens gerados

      redirect_to edit_o_proposta_path(@o_proposta), notice: "Proposta criada! Agora preencha os itens."
    else
      render :new, status: :unprocessable_entity
    end
  end


   def fornecedor_enviadas
    # Apenas propostas do fornecedor logado
    fornecedor = current_user.f_empresa_fornecedora
    @o_propostas = OProposta.where(f_empresa_fornecedora: fornecedor)
                          .where(o_status: OStatus.where(descricao: ['Pendente', 'Enviada', 'Aprovada']))
                          .order(created_at: :desc)
   end

  def update
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

  private

  def set_o_proposta
    @o_proposta = OProposta.find(params[:id])
  end

  def o_proposta_params
    params.require(:o_proposta).permit(
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
end
