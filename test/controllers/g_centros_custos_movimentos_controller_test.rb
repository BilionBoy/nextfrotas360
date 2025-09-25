require "test_helper"

class GCentrosCustosMovimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @g_centro_custo_movimento = g_centros_custos_movimentos(:one)
  end

  test "should get index" do
    get g_centros_custos_movimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_g_centro_custo_movimento_url
    assert_response :success
  end

  test "should create g_centro_custo_movimento" do
    assert_difference("GCentroCustoMovimento.count") do
      post g_centros_custos_movimentos_url, params: { g_centro_custo_movimento: { descricao: @g_centro_custo_movimento.descricao, g_centro_custo_id: @g_centro_custo_movimento.g_centro_custo_id, g_tipo_movimento_id: @g_centro_custo_movimento.g_tipo_movimento_id, referencia_id: @g_centro_custo_movimento.referencia_id, referencia_tipo: @g_centro_custo_movimento.referencia_tipo, valor: @g_centro_custo_movimento.valor } }
    end

    assert_redirected_to g_centro_custo_movimento_url(GCentroCustoMovimento.last)
  end

  test "should show g_centro_custo_movimento" do
    get g_centro_custo_movimento_url(@g_centro_custo_movimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_g_centro_custo_movimento_url(@g_centro_custo_movimento)
    assert_response :success
  end

  test "should update g_centro_custo_movimento" do
    patch g_centro_custo_movimento_url(@g_centro_custo_movimento), params: { g_centro_custo_movimento: { descricao: @g_centro_custo_movimento.descricao, g_centro_custo_id: @g_centro_custo_movimento.g_centro_custo_id, g_tipo_movimento_id: @g_centro_custo_movimento.g_tipo_movimento_id, referencia_id: @g_centro_custo_movimento.referencia_id, referencia_tipo: @g_centro_custo_movimento.referencia_tipo, valor: @g_centro_custo_movimento.valor } }
    assert_redirected_to g_centro_custo_movimento_url(@g_centro_custo_movimento)
  end

  test "should destroy g_centro_custo_movimento" do
    assert_difference("GCentroCustoMovimento.count", -1) do
      delete g_centro_custo_movimento_url(@g_centro_custo_movimento)
    end

    assert_redirected_to g_centros_custos_movimentos_url
  end
end
