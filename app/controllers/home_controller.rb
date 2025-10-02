class HomeController < ApplicationController
  def index
    if current_user.gestor?
      load_gestor_data
      render :gestor
    elsif current_user.fornecedor?
      load_fornecedor_data
      render :fornecedor
    else
      render :index
    end
  end

  private

  ## ==========================
  ## FORNECEDOR
  ## ==========================
  def load_fornecedor_data
    @fornecedor = current_user.f_empresa_fornecedora

    # Relacionamentos
    @fornecedor_financeiros = @fornecedor.f_financeiros.includes(:f_financeiros_movimentos)
    @fornecedor_servicos    = @fornecedor.f_empresas_servicos.includes(:o_categoria_servico)

    @categorias_servicos = OCategoriaServico.all
    @tipos_movimentos    = GTipoMovimento.all

    load_movimentos_financeiros
    load_servicos_por_categoria
    load_solicitacoes_fornecedor
  end

  def load_movimentos_financeiros
    @fornecedor_movimentos = @fornecedor_financeiros.flat_map(&:f_financeiros_movimentos)

    @movimentos_por_tipo = @tipos_movimentos.map do |tipo|
      OpenStruct.new(
        descricao: tipo.descricao,
        valor: @fornecedor_movimentos.select { |m| m.g_tipo_movimento_id == tipo.id }.sum(&:valor)
      )
    end
  end

  def load_servicos_por_categoria
    @servicos_por_categoria = @categorias_servicos.map do |cat|
      OpenStruct.new(
        descricao: cat.descricao,
        count: @fornecedor_servicos.count { |s| s.o_categoria_servico_id == cat.id },
        saldo: @fornecedor_financeiros.where(o_categoria_servico_id: cat.id).sum(:saldo_disponivel) || 0
      )
    end
  end

  def load_solicitacoes_fornecedor
    @solicitacoes = [] # TODO: substituir depois quando ligarmos fornecedor → solicitações
  end

  ## ==========================
  ## GESTOR
  ## ==========================
 def load_gestor_data
   # Orçamento total aprovado
   @orcamento_total = GCentroCusto.sum(:valor_inicial)
 
   # Gastos totais realizados
   @gastos_totais = GCentroCusto.sum(:valor_inicial) - GCentroCusto.sum(:saldo_atual)
 
   # Solicitações por status
   @solicitacoes_por_status = OSolicitacao.group(:o_status_id).count
   @status_labels = OStatus.where(id: @solicitacoes_por_status.keys).pluck(:descricao)
 
   # Totais de solicitações para os cards
   @solicitacoes_total      = OSolicitacao.count
   @solicitacoes_pendentes  = OSolicitacao.joins(:o_status).where(o_status: { descricao: "Pendente" }).count
   @solicitacoes_andamento  = OSolicitacao.joins(:o_status).where(o_status: { descricao: "Em Cotação" }).count
   @solicitacoes_concluidas = OSolicitacao.joins(:o_status).where(o_status: { descricao: "Concluída" }).count
 
   # Cotações em andamento
   @cotacoes_em_andamento = OCotacao.includes(:o_solicitacao)
                                    .where(o_status_id: OStatus.find_by(descricao: "Em Cotação")&.id)
 
   # Propostas recebidas
   @propostas_recebidas = OProposta.includes(:o_cotacao, :f_empresa_fornecedora).count
 
   # Serviços ativos
   @servicos_ativos = OSolicitacao.where(o_status_id: OStatus.find_by(descricao: "Em Execução")&.id).count
 
   # Solicitações por categoria (para o gráfico de barras)
   @solicitacoes_por_categoria = OCategoriaServico.all.map do |cat|
     OpenStruct.new(
       descricao: cat.descricao,
       count: OSolicitacao.where(o_categoria_servico_id: cat.id).count
     )
   end
 
   # Gastos por centro de custo (para o gráfico de pizza/doughnut)
   @gastos_por_centro = GCentroCusto.all.map do |cc|
     OpenStruct.new(
       nome: cc.nome,
       valor: cc.valor_inicial - cc.saldo_atual
     )
   end
 end

end
