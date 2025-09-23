require "test_helper"

class GTiposCentrosCustosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @g_tipo_centro_custo = g_tipos_centros_custos(:one)
  end

  test "should get index" do
    get g_tipos_centros_custos_url
    assert_response :success
  end

  test "should get new" do
    get new_g_tipo_centro_custo_url
    assert_response :success
  end

  test "should create g_tipo_centro_custo" do
    assert_difference("GTipoCentroCusto.count") do
      post g_tipos_centros_custos_url, params: { g_tipo_centro_custo: { descricao: @g_tipo_centro_custo.descricao } }
    end

    assert_redirected_to g_tipo_centro_custo_url(GTipoCentroCusto.last)
  end

  test "should show g_tipo_centro_custo" do
    get g_tipo_centro_custo_url(@g_tipo_centro_custo)
    assert_response :success
  end

  test "should get edit" do
    get edit_g_tipo_centro_custo_url(@g_tipo_centro_custo)
    assert_response :success
  end

  test "should update g_tipo_centro_custo" do
    patch g_tipo_centro_custo_url(@g_tipo_centro_custo), params: { g_tipo_centro_custo: { descricao: @g_tipo_centro_custo.descricao } }
    assert_redirected_to g_tipo_centro_custo_url(@g_tipo_centro_custo)
  end

  test "should destroy g_tipo_centro_custo" do
    assert_difference("GTipoCentroCusto.count", -1) do
      delete g_tipo_centro_custo_url(@g_tipo_centro_custo)
    end

    assert_redirected_to g_tipos_centros_custos_url
  end
end
