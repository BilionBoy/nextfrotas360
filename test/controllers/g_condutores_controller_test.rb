require "test_helper"

class GCondutoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @g_condutor = g_condutores(:one)
  end

  test "should get index" do
    get g_condutores_url
    assert_response :success
  end

  test "should get new" do
    get new_g_condutor_url
    assert_response :success
  end

  test "should create g_condutor" do
    assert_difference("GCondutor.count") do
      post g_condutores_url, params: { g_condutor: { cnh_numero: @g_condutor.cnh_numero, email: @g_condutor.email, g_carteira_orgao_emissor_id: @g_condutor.g_carteira_orgao_emissor_id, g_categoria_carteira_condutor_id: @g_condutor.g_categoria_carteira_condutor_id, g_status_id: @g_condutor.g_status_id, nome: @g_condutor.nome, telefone: @g_condutor.telefone, validace_cnh: @g_condutor.validace_cnh } }
    end

    assert_redirected_to g_condutor_url(GCondutor.last)
  end

  test "should show g_condutor" do
    get g_condutor_url(@g_condutor)
    assert_response :success
  end

  test "should get edit" do
    get edit_g_condutor_url(@g_condutor)
    assert_response :success
  end

  test "should update g_condutor" do
    patch g_condutor_url(@g_condutor), params: { g_condutor: { cnh_numero: @g_condutor.cnh_numero, email: @g_condutor.email, g_carteira_orgao_emissor_id: @g_condutor.g_carteira_orgao_emissor_id, g_categoria_carteira_condutor_id: @g_condutor.g_categoria_carteira_condutor_id, g_status_id: @g_condutor.g_status_id, nome: @g_condutor.nome, telefone: @g_condutor.telefone, validace_cnh: @g_condutor.validace_cnh } }
    assert_redirected_to g_condutor_url(@g_condutor)
  end

  test "should destroy g_condutor" do
    assert_difference("GCondutor.count", -1) do
      delete g_condutor_url(@g_condutor)
    end

    assert_redirected_to g_condutores_url
  end
end
