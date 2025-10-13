# frozen_string_literal: true
class OOrdemServicosController < ApplicationController
  before_action :set_o_ordem_servico, only: [:show, :marcar_como_atendida, :validar_servico, :aplicar_taxa_admin]

  # GET /o_ordem_servicos
  def index
    @q = OOrdemServico.accessible_by(current_ability).ransack(params[:q])
    @pagy, @o_ordem_servicos = pagy(
      @q.result
        .includes(
          :o_status,
          :g_veiculo,
          :f_empresa_fornecedora,
          :t_taxa,
          o_proposta: [:o_status, o_cotacao: :o_solicitacao]
        )
        .order(created_at: :desc)
    )
  end

  # PATCH /o_ordem_servicos/:id/marcar_como_atendida
  def marcar_como_atendida
    authorize_fornecedor!
    @o_ordem_servico.marcar_como_atendida!
    redirect_to o_ordem_servicos_path, notice: "Ordem marcada como atendida — aguardando validação do gestor."
  rescue ActiveRecord::RecordInvalid => e
    redirect_to o_ordem_servico_path(@o_ordem_servico), alert: "Falha ao atualizar: #{e.message}"
  end

  # PATCH /o_ordem_servicos/:id/validar_servico
  def validar_servico
    redirect_unless_gestor!
    @o_ordem_servico.finalizar!(current_user)
    redirect_to o_ordem_servicos_path, notice: "Serviço validado com sucesso — OS concluída."
  rescue ActiveRecord::RecordInvalid => e
    redirect_to o_ordem_servico_path(@o_ordem_servico), alert: "Falha ao validar: #{e.message}"
  end

  # PATCH /o_ordem_servicos/:id/aplicar_taxa_admin
  def aplicar_taxa_admin
    redirect_unless_admin!
    
    taxa_id = params[:t_taxa_id]
    @o_ordem_servico.aplicar_taxa_admin!(current_user, taxa_id)

    redirect_to o_ordem_servicos_path, notice: "Taxa aplicada e pagamento registrado com sucesso."
  rescue ActiveRecord::RecordInvalid, StandardError => e
    redirect_to o_ordem_servicos_path, alert: "Erro ao aplicar taxa: #{e.message}"
  end

def enviar_nf
  if request.get?
    # GET → listar apenas OS da empresa do fornecedor logado
    if current_user.fornecedor?
      @o_ordem_servicos = OOrdemServico.joins(:o_proposta)
                                       .where(o_propostas: { f_empresa_fornecedora_id: current_user.f_empresa_fornecedora_id })
    else
      @o_ordem_servicos = OOrdemServico.all
    end
    @o_nota_fiscal = ONotaFiscal.new
  elsif request.post?
    # POST → criar a NF
    @o_nota_fiscal = ONotaFiscal.new(o_nota_fiscal_params)
    if @o_nota_fiscal.save
      redirect_to enviar_nf_o_ordem_servicos_path, notice: "Nota Fiscal enviada com sucesso!"
    else
      # manter o filtro no render caso dê erro
      if current_user.fornecedor?
        @o_ordem_servicos = OOrdemServico.joins(:o_proposta)
                                         .where(o_propostas: { f_empresa_fornecedora_id: current_user.f_empresa_fornecedora_id })
      else
        @o_ordem_servicos = OOrdemServico.all
      end
      render :enviar_nf, status: :unprocessable_entity
    end
  end
end



  private

  def set_o_ordem_servico
    @o_ordem_servico = OOrdemServico.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to o_ordem_servicos_path, alert: "Ordem de Serviço não encontrada"
  end

  def authorize_fornecedor!
    unless current_user.fornecedor? && @o_ordem_servico.f_empresa_fornecedora_id == current_user.f_empresa_fornecedora_id
      redirect_to o_ordem_servicos_path, alert: "Acesso negado"
    end
  end

  def redirect_unless_gestor!
    redirect_to o_ordem_servicos_path, alert: "Acesso negado" unless current_user.gestor?
  end

  def redirect_unless_admin!
    redirect_to o_ordem_servicos_path, alert: "Acesso negado" unless current_user.admin?
  end


  def o_nota_fiscal_params
    permitted_attributes = ONotaFiscal.column_names - ['deleted_at', 'created_by', 'updated_by']
    params.require(:o_nota_fiscal).permit(permitted_attributes.map(&:to_sym), :arquivo_pdf,:arquivo_xml)
  end
end
