require "test_helper"

class ONotasFiscaisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o_nota_fiscal = o_notas_fiscais(:one)
  end

  test "should get index" do
    get o_notas_fiscais_url
    assert_response :success
  end

  test "should get new" do
    get new_o_nota_fiscal_url
    assert_response :success
  end

  test "should create o_nota_fiscal" do
    assert_difference("ONotaFiscal.count") do
      post o_notas_fiscais_url, params: { o_nota_fiscal: { data_emissao: @o_nota_fiscal.data_emissao, numero: @o_nota_fiscal.numero, o_ordem_servico_id: @o_nota_fiscal.o_ordem_servico_id, o_status_nf_id: @o_nota_fiscal.o_status_nf_id, valor_total: @o_nota_fiscal.valor_total } }
    end

    assert_redirected_to o_nota_fiscal_url(ONotaFiscal.last)
  end

  test "should show o_nota_fiscal" do
    get o_nota_fiscal_url(@o_nota_fiscal)
    assert_response :success
  end

  test "should get edit" do
    get edit_o_nota_fiscal_url(@o_nota_fiscal)
    assert_response :success
  end

  test "should update o_nota_fiscal" do
    patch o_nota_fiscal_url(@o_nota_fiscal), params: { o_nota_fiscal: { data_emissao: @o_nota_fiscal.data_emissao, numero: @o_nota_fiscal.numero, o_ordem_servico_id: @o_nota_fiscal.o_ordem_servico_id, o_status_nf_id: @o_nota_fiscal.o_status_nf_id, valor_total: @o_nota_fiscal.valor_total } }
    assert_redirected_to o_nota_fiscal_url(@o_nota_fiscal)
  end

  test "should destroy o_nota_fiscal" do
    assert_difference("ONotaFiscal.count", -1) do
      delete o_nota_fiscal_url(@o_nota_fiscal)
    end

    assert_redirected_to o_notas_fiscais_url
  end
end
