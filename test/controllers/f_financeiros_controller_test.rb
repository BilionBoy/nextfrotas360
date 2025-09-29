require "test_helper"

class FFinanceirosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @f_financeiro = f_financeiros(:one)
  end

  test "should get index" do
    get f_financeiros_url
    assert_response :success
  end

  test "should get new" do
    get new_f_financeiro_url
    assert_response :success
  end

  test "should create f_financeiro" do
    assert_difference("FFinanceiro.count") do
      post f_financeiros_url, params: { f_financeiro: { f_empresa_fornecedora_id: @f_financeiro.f_empresa_fornecedora_id, o_categoria_servico_id: @f_financeiro.o_categoria_servico_id, saldo_disponivel: @f_financeiro.saldo_disponivel, saldo_reservado: @f_financeiro.saldo_reservado, saldo_total: @f_financeiro.saldo_total } }
    end

    assert_redirected_to f_financeiro_url(FFinanceiro.last)
  end

  test "should show f_financeiro" do
    get f_financeiro_url(@f_financeiro)
    assert_response :success
  end

  test "should get edit" do
    get edit_f_financeiro_url(@f_financeiro)
    assert_response :success
  end

  test "should update f_financeiro" do
    patch f_financeiro_url(@f_financeiro), params: { f_financeiro: { f_empresa_fornecedora_id: @f_financeiro.f_empresa_fornecedora_id, o_categoria_servico_id: @f_financeiro.o_categoria_servico_id, saldo_disponivel: @f_financeiro.saldo_disponivel, saldo_reservado: @f_financeiro.saldo_reservado, saldo_total: @f_financeiro.saldo_total } }
    assert_redirected_to f_financeiro_url(@f_financeiro)
  end

  test "should destroy f_financeiro" do
    assert_difference("FFinanceiro.count", -1) do
      delete f_financeiro_url(@f_financeiro)
    end

    assert_redirected_to f_financeiros_url
  end
end
