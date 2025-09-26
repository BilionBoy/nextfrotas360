require "test_helper"

class FEmpresasFornecedorasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @f_empresa_fornecedora = f_empresas_fornecedoras(:one)
  end

  test "should get index" do
    get f_empresas_fornecedoras_url
    assert_response :success
  end

  test "should get new" do
    get new_f_empresa_fornecedora_url
    assert_response :success
  end

  test "should create f_empresa_fornecedora" do
    assert_difference("FEmpresaFornecedora.count") do
      post f_empresas_fornecedoras_url, params: { f_empresa_fornecedora: { a_status_id: @f_empresa_fornecedora.a_status_id, cnjp: @f_empresa_fornecedora.cnjp, contato: @f_empresa_fornecedora.contato, email: @f_empresa_fornecedora.email, endereco: @f_empresa_fornecedora.endereco, g_municipio_id: @f_empresa_fornecedora.g_municipio_id, nome_fantasia: @f_empresa_fornecedora.nome_fantasia, razao_social: @f_empresa_fornecedora.razao_social, telefone: @f_empresa_fornecedora.telefone } }
    end

    assert_redirected_to f_empresa_fornecedora_url(FEmpresaFornecedora.last)
  end

  test "should show f_empresa_fornecedora" do
    get f_empresa_fornecedora_url(@f_empresa_fornecedora)
    assert_response :success
  end

  test "should get edit" do
    get edit_f_empresa_fornecedora_url(@f_empresa_fornecedora)
    assert_response :success
  end

  test "should update f_empresa_fornecedora" do
    patch f_empresa_fornecedora_url(@f_empresa_fornecedora), params: { f_empresa_fornecedora: { a_status_id: @f_empresa_fornecedora.a_status_id, cnjp: @f_empresa_fornecedora.cnjp, contato: @f_empresa_fornecedora.contato, email: @f_empresa_fornecedora.email, endereco: @f_empresa_fornecedora.endereco, g_municipio_id: @f_empresa_fornecedora.g_municipio_id, nome_fantasia: @f_empresa_fornecedora.nome_fantasia, razao_social: @f_empresa_fornecedora.razao_social, telefone: @f_empresa_fornecedora.telefone } }
    assert_redirected_to f_empresa_fornecedora_url(@f_empresa_fornecedora)
  end

  test "should destroy f_empresa_fornecedora" do
    assert_difference("FEmpresaFornecedora.count", -1) do
      delete f_empresa_fornecedora_url(@f_empresa_fornecedora)
    end

    assert_redirected_to f_empresas_fornecedoras_url
  end
end
