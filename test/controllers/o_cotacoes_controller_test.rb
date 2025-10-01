require "test_helper"

class OCotacoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o_cotacao = o_cotacoes(:one)
  end

  test "should get index" do
    get o_cotacoes_url
    assert_response :success
  end

  test "should get new" do
    get new_o_cotacao_url
    assert_response :success
  end

  test "should create o_cotacao" do
    assert_difference("OCotacao.count") do
      post o_cotacoes_url, params: { o_cotacao: { data_expiracao: @o_cotacao.data_expiracao, o_solicitacao_id: @o_cotacao.o_solicitacao_id, o_status_id: @o_cotacao.o_status_id, o_visibilidade_id: @o_cotacao.o_visibilidade_id } }
    end

    assert_redirected_to o_cotacao_url(OCotacao.last)
  end

  test "should show o_cotacao" do
    get o_cotacao_url(@o_cotacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_o_cotacao_url(@o_cotacao)
    assert_response :success
  end

  test "should update o_cotacao" do
    patch o_cotacao_url(@o_cotacao), params: { o_cotacao: { data_expiracao: @o_cotacao.data_expiracao, o_solicitacao_id: @o_cotacao.o_solicitacao_id, o_status_id: @o_cotacao.o_status_id, o_visibilidade_id: @o_cotacao.o_visibilidade_id } }
    assert_redirected_to o_cotacao_url(@o_cotacao)
  end

  test "should destroy o_cotacao" do
    assert_difference("OCotacao.count", -1) do
      delete o_cotacao_url(@o_cotacao)
    end

    assert_redirected_to o_cotacoes_url
  end
end
