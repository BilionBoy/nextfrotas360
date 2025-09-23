require "test_helper"

class OTiposSolicitacoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o_tipo_solicitacao = o_tipos_solicitacoes(:one)
  end

  test "should get index" do
    get o_tipos_solicitacoes_url
    assert_response :success
  end

  test "should get new" do
    get new_o_tipo_solicitacao_url
    assert_response :success
  end

  test "should create o_tipo_solicitacao" do
    assert_difference("OTipoSolicitacao.count") do
      post o_tipos_solicitacoes_url, params: { o_tipo_solicitacao: { descricao: @o_tipo_solicitacao.descricao } }
    end

    assert_redirected_to o_tipo_solicitacao_url(OTipoSolicitacao.last)
  end

  test "should show o_tipo_solicitacao" do
    get o_tipo_solicitacao_url(@o_tipo_solicitacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_o_tipo_solicitacao_url(@o_tipo_solicitacao)
    assert_response :success
  end

  test "should update o_tipo_solicitacao" do
    patch o_tipo_solicitacao_url(@o_tipo_solicitacao), params: { o_tipo_solicitacao: { descricao: @o_tipo_solicitacao.descricao } }
    assert_redirected_to o_tipo_solicitacao_url(@o_tipo_solicitacao)
  end

  test "should destroy o_tipo_solicitacao" do
    assert_difference("OTipoSolicitacao.count", -1) do
      delete o_tipo_solicitacao_url(@o_tipo_solicitacao)
    end

    assert_redirected_to o_tipos_solicitacoes_url
  end
end
