class HomeController < ApplicationController
  def index
    if current_user.gestor?
      render :gestor
    elsif current_user.fornecedor?
      load_fornecedor_data
      render :fornecedor
    else
      render :index
    end
  end

  private

  def load_fornecedor_data
    @fornecedor = current_user.f_empresa_fornecedora

    # Carrega dados relacionados de forma eficiente
    @fornecedor_financeiros = @fornecedor.f_financeiros.includes(:f_financeiros_movimentos)
    @fornecedor_servicos    = @fornecedor.f_empresas_servicos.includes(:o_categoria_servico)

    @categorias_servicos = OCategoriaServico.all
    @tipos_movimentos    = GTipoMovimento.all

    load_movimentos_financeiros
    load_servicos_por_categoria
    load_solicitacoes
  end

  def load_movimentos_financeiros
    # Agrega todos os movimentos de todos os financeiros do fornecedor
    @fornecedor_movimentos = @fornecedor_financeiros.flat_map(&:f_financeiros_movimentos)

    # Calcula valor por tipo de movimento para gráficos
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

  def load_solicitacoes
    # Mock por enquanto; substituir quando criar associação
    @solicitacoes = []
  end
end
