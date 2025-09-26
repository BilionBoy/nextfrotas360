require "test_helper"

class GCondutoresVeiculosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @g_condutor_veiculo = g_condutores_veiculos(:one)
  end

  test "should get index" do
    get g_condutores_veiculos_url
    assert_response :success
  end

  test "should get new" do
    get new_g_condutor_veiculo_url
    assert_response :success
  end

  test "should create g_condutor_veiculo" do
    assert_difference("GCondutorVeiculo.count") do
      post g_condutores_veiculos_url, params: { g_condutor_veiculo: { data_inicio: @g_condutor_veiculo.data_inicio, g_condutor_id: @g_condutor_veiculo.g_condutor_id, g_veiculo_id: @g_condutor_veiculo.g_veiculo_id } }
    end

    assert_redirected_to g_condutor_veiculo_url(GCondutorVeiculo.last)
  end

  test "should show g_condutor_veiculo" do
    get g_condutor_veiculo_url(@g_condutor_veiculo)
    assert_response :success
  end

  test "should get edit" do
    get edit_g_condutor_veiculo_url(@g_condutor_veiculo)
    assert_response :success
  end

  test "should update g_condutor_veiculo" do
    patch g_condutor_veiculo_url(@g_condutor_veiculo), params: { g_condutor_veiculo: { data_inicio: @g_condutor_veiculo.data_inicio, g_condutor_id: @g_condutor_veiculo.g_condutor_id, g_veiculo_id: @g_condutor_veiculo.g_veiculo_id } }
    assert_redirected_to g_condutor_veiculo_url(@g_condutor_veiculo)
  end

  test "should destroy g_condutor_veiculo" do
    assert_difference("GCondutorVeiculo.count", -1) do
      delete g_condutor_veiculo_url(@g_condutor_veiculo)
    end

    assert_redirected_to g_condutores_veiculos_url
  end
end
