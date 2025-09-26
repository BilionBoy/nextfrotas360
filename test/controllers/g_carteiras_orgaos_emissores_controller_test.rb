require "test_helper"

class GCarteirasOrgaosEmissoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @g_carteira_orgao_emissor = g_carteiras_orgaos_emissores(:one)
  end

  test "should get index" do
    get g_carteiras_orgaos_emissores_url
    assert_response :success
  end

  test "should get new" do
    get new_g_carteira_orgao_emissor_url
    assert_response :success
  end

  test "should create g_carteira_orgao_emissor" do
    assert_difference("GCarteiraOrgaoEmissor.count") do
      post g_carteiras_orgaos_emissores_url, params: { g_carteira_orgao_emissor: { descricao: @g_carteira_orgao_emissor.descricao } }
    end

    assert_redirected_to g_carteira_orgao_emissor_url(GCarteiraOrgaoEmissor.last)
  end

  test "should show g_carteira_orgao_emissor" do
    get g_carteira_orgao_emissor_url(@g_carteira_orgao_emissor)
    assert_response :success
  end

  test "should get edit" do
    get edit_g_carteira_orgao_emissor_url(@g_carteira_orgao_emissor)
    assert_response :success
  end

  test "should update g_carteira_orgao_emissor" do
    patch g_carteira_orgao_emissor_url(@g_carteira_orgao_emissor), params: { g_carteira_orgao_emissor: { descricao: @g_carteira_orgao_emissor.descricao } }
    assert_redirected_to g_carteira_orgao_emissor_url(@g_carteira_orgao_emissor)
  end

  test "should destroy g_carteira_orgao_emissor" do
    assert_difference("GCarteiraOrgaoEmissor.count", -1) do
      delete g_carteira_orgao_emissor_url(@g_carteira_orgao_emissor)
    end

    assert_redirected_to g_carteiras_orgaos_emissores_url
  end
end
