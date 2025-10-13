# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :load_dashboard

  def index
    case current_user.a_tipo_usuario&.descricao&.downcase
    when 'gestor'
      render :gestor
    when 'fornecedor'
      render :fornecedor
    else
      render :index
    end
  end

  def gestor
    authorize_user(:gestor)
    render :gestor
  end

  def fornecedor
    authorize_user(:fornecedor)
    render :fornecedor
  end

  private

  # --------------------------------------------------
  # 🔹 Roteia dados conforme o tipo de usuário
  # --------------------------------------------------
  def load_dashboard
    if current_user.admin?
      load_admin_data
    elsif current_user.gestor?
      load_gestor_data
    elsif current_user.fornecedor?
      load_fornecedor_data
    end
  end

  def authorize_user(tipo)
    redirect_to root_path unless current_user&.send("#{tipo}?")
  end

  # --------------------------------------------------
  # 🔹 DASHBOARD ADMINISTRADOR
  # --------------------------------------------------
  def load_admin_data
    resumo = GCentroCusto
               .unscope(:select)
               .select('COALESCE(SUM(valor_inicial), 0) AS total_orcamento')
               .take

    @orcamento_total = resumo.total_orcamento.to_f

    # 🔹 Total pago líquido (corrigido para evitar negativos)
    @gastos_totais = OOrdemServico
                       .joins(:o_status)
                       .where(o_status: { descricao: 'Pago' })
                       .sum do |os|
                         os.custo_real.to_f - os.taxa_aplicada.to_f
                       end

    @saldo_disponivel = @orcamento_total - @gastos_totais

    # 🔹 Receita de taxas
    @receita_taxas = OOrdemServico
                       .joins(:o_status)
                       .where(o_status: { descricao: 'Pago' })
                       .sum(:taxa_aplicada)
                       .to_f

    @variacao_receita = 0 # placeholder

    # 🔹 Contadores gerais
    @solicitacoes_total      = OSolicitacao.count
    @solicitacoes_pendentes  = OSolicitacao.joins(:o_status).where(o_status: { descricao: 'Pendente' }).count
    @solicitacoes_andamento  = OSolicitacao.joins(:o_status).where(o_status: { descricao: 'Em Cotação' }).count
    @solicitacoes_concluidas = OSolicitacao.joins(:o_status).where(o_status: { descricao: 'Concluída' }).count

    @cotacoes_em_andamento = OCotacao.joins(:o_status).where(o_status: { descricao: 'Em Cotação' }).count
    @propostas_recebidas   = OProposta.count
    @servicos_ativos       = OOrdemServico.joins(:o_status).where(o_status: { descricao: 'Ativo' }).count

    load_admin_chart_data
    load_admin_recent_activities
  end

  def load_admin_chart_data
    # 1️⃣ Solicitações por Status
    solicitacoes_status = OSolicitacao
                            .joins(:o_status)
                            .group('o_status.descricao')
                            .count

    @status_labels           = solicitacoes_status.keys
    @solicitacoes_por_status = solicitacoes_status.values

    # 2️⃣ Solicitações por Categoria
    solicitacoes_categoria = OSolicitacao
                               .joins(:o_categoria_servico)
                               .group('o_categorias_servicos.descricao')
                               .order(Arel.sql('COUNT(*) DESC'))
                               .limit(10)
                               .count

    @categoria_labels           = solicitacoes_categoria.keys
    @solicitacoes_por_categoria = solicitacoes_categoria.values

    # 3️⃣ Gastos por Centro de Custo
    centros_custos = GCentroCusto
                       .where('valor_inicial > 0')
                       .select('nome, (valor_inicial - saldo_atual) AS gasto')
                       .order(Arel.sql('gasto DESC'))
                       .limit(10)

    @centro_custo_labels = centros_custos.map(&:nome)
    @gastos_por_centro   = centros_custos.map { |c| c.gasto.to_f }
  end

  def load_admin_recent_activities
    @atividades_recentes = OSolicitacao
                             .includes(:o_status, :o_categoria_servico, :g_centro_custo)
                             .order(created_at: :desc)
                             .limit(10)
                             .map do |sol|
      {
        id:           sol.id,
        descricao:    sol.descricao || 'Sem descrição',
        status:       sol.o_status&.descricao || 'N/A',
        categoria:    sol.o_categoria_servico&.descricao || 'N/A',
        centro_custo: sol.g_centro_custo&.nome || 'N/A',
        data:         sol.created_at.strftime('%d/%m/%Y')
      }
    end
  end

  # --------------------------------------------------
  # 🔹 DASHBOARD GESTOR
  # --------------------------------------------------
  def load_gestor_data
    resumo = GCentroCusto
               .unscope(:select)
               .select('COALESCE(SUM(valor_inicial), 0) AS total_orcamento')
               .take

    @orcamento_total = resumo.total_orcamento.to_f

    @gastos_totais = OOrdemServico
                       .joins(:o_status)
                       .where(o_status: { descricao: 'Pago' })
                       .sum { |os| os.custo_real.to_f - os.taxa_aplicada.to_f }

    @receita_taxas = OOrdemServico
                       .joins(:o_status)
                       .where(o_status: { descricao: 'Pago' })
                       .sum(:taxa_aplicada)
                       .to_f

    @variacao_receita = 0

    @solicitacoes_total      = OSolicitacao.count
    @solicitacoes_pendentes  = OSolicitacao.joins(:o_status).where(o_status: { descricao: 'Pendente' }).count
    @solicitacoes_andamento  = OSolicitacao.joins(:o_status).where(o_status: { descricao: 'Em Cotação' }).count
    @solicitacoes_concluidas = OSolicitacao.joins(:o_status).where(o_status: { descricao: 'Concluída' }).count

    @cotacoes_em_andamento = OCotacao.joins(:o_status).where(o_status: { descricao: 'Em Cotação' }).count
    @propostas_recebidas   = OProposta.count
    @servicos_ativos       = OOrdemServico.joins(:o_status).where(o_status: { descricao: 'Ativo' }).count

    solicitacoes_status = OSolicitacao
                            .joins(:o_status)
                            .group('o_status.descricao')
                            .count

    @status_labels           = solicitacoes_status.keys
    @solicitacoes_por_status = solicitacoes_status.values

    solicitacoes_categoria = OSolicitacao
                               .joins(:o_categoria_servico)
                               .group('o_categorias_servicos.descricao')
                               .order(Arel.sql('COUNT(*) DESC'))
                               .limit(10)
                               .count

    @solicitacoes_por_categoria = solicitacoes_categoria.map do |descricao, count|
      OpenStruct.new(descricao:, count:)
    end

    centros_custos = GCentroCusto
                       .where('valor_inicial > 0')
                       .select('nome, (valor_inicial - saldo_atual) AS gasto')
                       .order(Arel.sql('gasto DESC'))
                       .limit(10)

    @gastos_por_centro = centros_custos.map { |c| OpenStruct.new(nome: c.nome, valor: c.gasto.to_f) }
  end

  # --------------------------------------------------
  # 🔹 DASHBOARD FORNECEDOR
  # --------------------------------------------------
  def load_fornecedor_data
    @fornecedor = current_user.f_empresa_fornecedora
    return unless @fornecedor

    # Relacionamentos
    @fornecedor_financeiros = @fornecedor.f_financeiros.includes(:f_financeiros_movimentos)
    @fornecedor_servicos    = @fornecedor.f_empresas_servicos.includes(:o_categoria_servico)

    @categorias_servicos = OCategoriaServico.all
    @tipos_movimentos    = GTipoMovimento.all

     # 🔹 Saldos


  # 🔹 Saldos
    @saldo_disponivel = @fornecedor.f_financeiros.sum(:saldo_disponivel).to_f
   @saldo_a_receber = OOrdemServico
                     .joins(:o_status)
                     .where(o_status: { descricao: 'Pago' })
                     .where(f_empresa_fornecedora_id: @fornecedor.id)
                     .map { |os| os.custo_real - os.taxa_aplicada.to_f }
                     .sum
   Rails.logger.info "💰 Saldo a receber para fornecedor #{@fornecedor.id}: #{@saldo_a_receber}"

                         

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
        saldo: @fornecedor_financeiros.where(o_categoria_servico_id: cat.id).sum(:saldo_disponivel).to_f
      )
    end
  end

  def load_solicitacoes_fornecedor
    @solicitacoes = [] # TODO: substituir quando ligação fornecedor → solicitações for implementada
  end
end
