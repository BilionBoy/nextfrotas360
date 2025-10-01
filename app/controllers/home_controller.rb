class HomeController < ApplicationController
  def index
    if current_user.gestor?
      render :gestor

    elsif current_user.fornecedor?
      # fornecedor logado
      @fornecedor = current_user.f_empresa_fornecedora

      # financeiro e serviços
      @fornecedor_financeiro = @fornecedor&.financeiro
      @fornecedor_servicos = @fornecedor&.f_empresas_servicos || []

      # movimentos financeiros
      @fornecedor_movimentos = @fornecedor_financeiro&.f_financeiros_movimentos || []

      # tipos de movimentos para gráfico
      @tipos_movimentos = GTipoMovimento.all
      @movimentos_por_tipo = @tipos_movimentos.map do |tipo|
        OpenStruct.new(
          descricao: tipo.descricao,
          valor: @fornecedor_movimentos.select { |m| m.g_tipo_movimento_id == tipo.id }.sum(&:valor)
        )
      end

      # solicitações (mock 0 por enquanto)
      @solicitacoes = [] # trocar para @fornecedor.solicitacoes quando criar relação

      # categorias de serviço para gráfico
      @categorias_servicos = OCategoriaServico.all
      @servicos_por_categoria = @categorias_servicos.map do |cat|
        OpenStruct.new(
          descricao: cat.descricao,
          count: @fornecedor_servicos.select { |s| s.o_categoria_servico_id == cat.id }.count,
          saldo: @fornecedor_financeiro&.where(o_categoria_servico_id: cat.id)&.sum(:saldo_disponivel) || 0
        )
      end

      render :fornecedor
    else
      render :index
    end
  end
end
