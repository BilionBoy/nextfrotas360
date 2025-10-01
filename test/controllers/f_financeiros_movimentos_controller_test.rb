require "test_helper"

class FFinanceirosMovimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @f_financeiro_movimento = f_financeiros_movimentos(:one)
  end

  test "should get index" do
    get f_financeiros_movimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_f_financeiro_movimento_url
    assert_response :success
  end

  test "should create f_financeiro_movimento" do
    assert_difference("FFinanceiroMovimento.count") do
      post f_financeiros_movimentos_url, params: { f_financeiro_movimento: { descricao: @f_financeiro_movimento.descricao, f_financeiro_id: @f_financeiro_movimento.f_financeiro_id, g_tipo_movimento_id: @f_financeiro_movimento.g_tipo_movimento_id, observacao: @f_financeiro_movimento.observacao, valor: @f_financeiro_movimento.valor } }
    end

    assert_redirected_to f_financeiro_movimento_url(FFinanceiroMovimento.last)
  end

  test "should show f_financeiro_movimento" do
    get f_financeiro_movimento_url(@f_financeiro_movimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_f_financeiro_movimento_url(@f_financeiro_movimento)
    assert_response :success
  end

  test "should update f_financeiro_movimento" do
    patch f_financeiro_movimento_url(@f_financeiro_movimento), params: { f_financeiro_movimento: { descricao: @f_financeiro_movimento.descricao, f_financeiro_id: @f_financeiro_movimento.f_financeiro_id, g_tipo_movimento_id: @f_financeiro_movimento.g_tipo_movimento_id, observacao: @f_financeiro_movimento.observacao, valor: @f_financeiro_movimento.valor } }
    assert_redirected_to f_financeiro_movimento_url(@f_financeiro_movimento)
  end

  test "should destroy f_financeiro_movimento" do
    assert_difference("FFinanceiroMovimento.count", -1) do
      delete f_financeiro_movimento_url(@f_financeiro_movimento)
    end

    assert_redirected_to f_financeiros_movimentos_url
  end
end
