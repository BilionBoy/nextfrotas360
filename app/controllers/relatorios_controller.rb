# frozen_string_literal: true
class RelatoriosController < ApplicationController
  include Pagy::Backend

  # GET /relatorios/ordens_servico
  def ordens_servico
    @ordens_servico = OOrdemServico
      .includes(
        :f_empresa_fornecedora,
        :o_status,
        :t_taxa,
        :validado_por,
        o_proposta: [
          :f_empresa_fornecedora,
          :o_status,
          { usuario_envio: [] },
          { o_proposta_itens: :o_cotacao_item },
          { o_cotacao: [:o_status, :o_visibilidade, { o_cotacoes_itens: :o_categoria_servico }] }
        ],
        g_veiculo: [
          :a_status,
          :g_tipo_veiculo,
          { a_unidade: [:a_tipo_unidade, :a_status, :g_municipio] },
          :g_centro_custo
        ],
        o_nota_fiscal: [:o_status_nf]
      )
      .references(:o_propostas, :o_cotacao)
      .order(created_at: :desc)

    # Filtros opcionais
    @ordens_servico = @ordens_servico.where(o_status_id: params[:status_id]) if params[:status_id].present?
    @ordens_servico = @ordens_servico.where(f_empresa_fornecedora_id: params[:fornecedor_id]) if params[:fornecedor_id].present?
    if params[:inicio].present? && params[:fim].present?
      @ordens_servico = @ordens_servico.where('created_at BETWEEN ? AND ?', params[:inicio], params[:fim])
    end

    @pagy, @ordens_servico = pagy(@ordens_servico, items: 20)
  end

  # GET /relatorios/ordens_servico_fornecedor
  def ordens_servico_fornecedor
    # 🔹 Apenas OS do fornecedor logado
    @ordens_servico = OOrdemServico
      .includes(
        :f_empresa_fornecedora,
        :o_status,
        :t_taxa,
        :validado_por,
        o_proposta: [:f_empresa_fornecedora, :o_status],
        g_veiculo: [:g_tipo_veiculo, { a_unidade: [:a_tipo_unidade, :g_municipio] }],
        o_nota_fiscal: :o_status_nf
      )
      .where(f_empresa_fornecedora_id: current_user.f_empresa_fornecedora_id)
      .order(created_at: :desc)

    # Filtros opcionais: status e datas
    @ordens_servico = @ordens_servico.where(o_status_id: params[:status_id]) if params[:status_id].present?
    if params[:inicio].present? && params[:fim].present?
      @ordens_servico = @ordens_servico.where('created_at BETWEEN ? AND ?', params[:inicio], params[:fim])
    end

    # Paginação
    @pagy, @ordens_servico = pagy(@ordens_servico, items: 20)
  end

  # GET /relatorios/ordens_servico_gestor
def ordens_servico_gestor
  # 🔹 Apenas OS da unidade do gestor logado
  unidade_id = current_user.a_unidade_id

  @ordens_servico = OOrdemServico
    .includes(
      :f_empresa_fornecedora,
      :o_status,
      :t_taxa,
      :validado_por,
      o_proposta: [:f_empresa_fornecedora, :o_status],
      g_veiculo: [:g_tipo_veiculo, { a_unidade: [:a_tipo_unidade, :g_municipio] }],
      o_nota_fiscal: :o_status_nf
    )
    .joins(:g_veiculo)
    .where(g_veiculos: { a_unidade_id: unidade_id })
    .order(created_at: :desc)

  # 🔹 Filtros opcionais: status e datas
  @ordens_servico = @ordens_servico.where(o_status_id: params[:status_id]) if params[:status_id].present?
  if params[:inicio].present? && params[:fim].present?
    @ordens_servico = @ordens_servico.where('created_at BETWEEN ? AND ?', params[:inicio], params[:fim])
  end

  # 🔹 Paginação
  @pagy, @ordens_servico = pagy(@ordens_servico, items: 20)
end

end
