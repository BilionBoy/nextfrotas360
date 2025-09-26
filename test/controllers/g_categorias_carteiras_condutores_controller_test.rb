require "test_helper"

class GCategoriasCarteirasCondutoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @g_categoria_carteira_condutor = g_categorias_carteiras_condutores(:one)
  end

  test "should get index" do
    get g_categorias_carteiras_condutores_url
    assert_response :success
  end

  test "should get new" do
    get new_g_categoria_carteira_condutor_url
    assert_response :success
  end

  test "should create g_categoria_carteira_condutor" do
    assert_difference("GCategoriaCarteiraCondutor.count") do
      post g_categorias_carteiras_condutores_url, params: { g_categoria_carteira_condutor: { descricao: @g_categoria_carteira_condutor.descricao } }
    end

    assert_redirected_to g_categoria_carteira_condutor_url(GCategoriaCarteiraCondutor.last)
  end

  test "should show g_categoria_carteira_condutor" do
    get g_categoria_carteira_condutor_url(@g_categoria_carteira_condutor)
    assert_response :success
  end

  test "should get edit" do
    get edit_g_categoria_carteira_condutor_url(@g_categoria_carteira_condutor)
    assert_response :success
  end

  test "should update g_categoria_carteira_condutor" do
    patch g_categoria_carteira_condutor_url(@g_categoria_carteira_condutor), params: { g_categoria_carteira_condutor: { descricao: @g_categoria_carteira_condutor.descricao } }
    assert_redirected_to g_categoria_carteira_condutor_url(@g_categoria_carteira_condutor)
  end

  test "should destroy g_categoria_carteira_condutor" do
    assert_difference("GCategoriaCarteiraCondutor.count", -1) do
      delete g_categoria_carteira_condutor_url(@g_categoria_carteira_condutor)
    end

    assert_redirected_to g_categorias_carteiras_condutores_url
  end
end
