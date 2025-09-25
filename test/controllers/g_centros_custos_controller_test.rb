require "test_helper"

class GCentrosCustosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @g_centro_custo = g_centros_custos(:one)
  end

  test "should get index" do
    get g_centros_custos_url
    assert_response :success
  end

  test "should get new" do
    get new_g_centro_custo_url
    assert_response :success
  end

  test "should create g_centro_custo" do
    assert_difference("GCentroCusto.count") do
      post g_centros_custos_url, params: { g_centro_custo: { a_unidade_id: @g_centro_custo.a_unidade_id, codigo_dotacao: @g_centro_custo.codigo_dotacao, g_tipo_centro_custo_id: @g_centro_custo.g_tipo_centro_custo_id, nome: @g_centro_custo.nome, saldo_atual: @g_centro_custo.saldo_atual, valor_inicial: @g_centro_custo.valor_inicial } }
    end

    assert_redirected_to g_centro_custo_url(GCentroCusto.last)
  end

  test "should show g_centro_custo" do
    get g_centro_custo_url(@g_centro_custo)
    assert_response :success
  end

  test "should get edit" do
    get edit_g_centro_custo_url(@g_centro_custo)
    assert_response :success
  end

  test "should update g_centro_custo" do
    patch g_centro_custo_url(@g_centro_custo), params: { g_centro_custo: { a_unidade_id: @g_centro_custo.a_unidade_id, codigo_dotacao: @g_centro_custo.codigo_dotacao, g_tipo_centro_custo_id: @g_centro_custo.g_tipo_centro_custo_id, nome: @g_centro_custo.nome, saldo_atual: @g_centro_custo.saldo_atual, valor_inicial: @g_centro_custo.valor_inicial } }
    assert_redirected_to g_centro_custo_url(@g_centro_custo)
  end

  test "should destroy g_centro_custo" do
    assert_difference("GCentroCusto.count", -1) do
      delete g_centro_custo_url(@g_centro_custo)
    end

    assert_redirected_to g_centros_custos_url
  end
end
