require "test_helper"

class TTaxasEmpresasFornecedorasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_taxa_empresa_fornecedora = t_taxas_empresas_fornecedoras(:one)
  end

  test "should get index" do
    get t_taxas_empresas_fornecedoras_url
    assert_response :success
  end

  test "should get new" do
    get new_t_taxa_empresa_fornecedora_url
    assert_response :success
  end

  test "should create t_taxa_empresa_fornecedora" do
    assert_difference("TTaxaEmpresaFornecedora.count") do
      post t_taxas_empresas_fornecedoras_url, params: { t_taxa_empresa_fornecedora: { f_empresa_fornecedora_id: @t_taxa_empresa_fornecedora.f_empresa_fornecedora_id, t_taxa_id: @t_taxa_empresa_fornecedora.t_taxa_id } }
    end

    assert_redirected_to t_taxa_empresa_fornecedora_url(TTaxaEmpresaFornecedora.last)
  end

  test "should show t_taxa_empresa_fornecedora" do
    get t_taxa_empresa_fornecedora_url(@t_taxa_empresa_fornecedora)
    assert_response :success
  end

  test "should get edit" do
    get edit_t_taxa_empresa_fornecedora_url(@t_taxa_empresa_fornecedora)
    assert_response :success
  end

  test "should update t_taxa_empresa_fornecedora" do
    patch t_taxa_empresa_fornecedora_url(@t_taxa_empresa_fornecedora), params: { t_taxa_empresa_fornecedora: { f_empresa_fornecedora_id: @t_taxa_empresa_fornecedora.f_empresa_fornecedora_id, t_taxa_id: @t_taxa_empresa_fornecedora.t_taxa_id } }
    assert_redirected_to t_taxa_empresa_fornecedora_url(@t_taxa_empresa_fornecedora)
  end

  test "should destroy t_taxa_empresa_fornecedora" do
    assert_difference("TTaxaEmpresaFornecedora.count", -1) do
      delete t_taxa_empresa_fornecedora_url(@t_taxa_empresa_fornecedora)
    end

    assert_redirected_to t_taxas_empresas_fornecedoras_url
  end
end
