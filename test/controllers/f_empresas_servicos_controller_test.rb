require "test_helper"

class FEmpresasServicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @f_empresa_servico = f_empresas_servicos(:one)
  end

  test "should get index" do
    get f_empresas_servicos_url
    assert_response :success
  end

  test "should get new" do
    get new_f_empresa_servico_url
    assert_response :success
  end

  test "should create f_empresa_servico" do
    assert_difference("FEmpresaServico.count") do
      post f_empresas_servicos_url, params: { f_empresa_servico: { f_empresa_fornecedora_id: @f_empresa_servico.f_empresa_fornecedora_id, o_categoria_servico_id: @f_empresa_servico.o_categoria_servico_id } }
    end

    assert_redirected_to f_empresa_servico_url(FEmpresaServico.last)
  end

  test "should show f_empresa_servico" do
    get f_empresa_servico_url(@f_empresa_servico)
    assert_response :success
  end

  test "should get edit" do
    get edit_f_empresa_servico_url(@f_empresa_servico)
    assert_response :success
  end

  test "should update f_empresa_servico" do
    patch f_empresa_servico_url(@f_empresa_servico), params: { f_empresa_servico: { f_empresa_fornecedora_id: @f_empresa_servico.f_empresa_fornecedora_id, o_categoria_servico_id: @f_empresa_servico.o_categoria_servico_id } }
    assert_redirected_to f_empresa_servico_url(@f_empresa_servico)
  end

  test "should destroy f_empresa_servico" do
    assert_difference("FEmpresaServico.count", -1) do
      delete f_empresa_servico_url(@f_empresa_servico)
    end

    assert_redirected_to f_empresas_servicos_url
  end
end
