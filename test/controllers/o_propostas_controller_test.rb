require "test_helper"

class OPropostasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o_proposta = o_propostas(:one)
  end

  test "should get index" do
    get o_propostas_url
    assert_response :success
  end

  test "should get new" do
    get new_o_proposta_url
    assert_response :success
  end

  test "should create o_proposta" do
    assert_difference("OProposta.count") do
      post o_propostas_url, params: { o_proposta: { empresa_fornecedora_id: @o_proposta.empresa_fornecedora_id, o_cotacao_id: @o_proposta.o_cotacao_id, o_status_id: @o_proposta.o_status_id, prazo_execucao_dias: @o_proposta.prazo_execucao_dias, usuario_envio_id: @o_proposta.usuario_envio_id, validade_proposta: @o_proposta.validade_proposta, valor_total: @o_proposta.valor_total, versao: @o_proposta.versao } }
    end

    assert_redirected_to o_proposta_url(OProposta.last)
  end

  test "should show o_proposta" do
    get o_proposta_url(@o_proposta)
    assert_response :success
  end

  test "should get edit" do
    get edit_o_proposta_url(@o_proposta)
    assert_response :success
  end

  test "should update o_proposta" do
    patch o_proposta_url(@o_proposta), params: { o_proposta: { empresa_fornecedora_id: @o_proposta.empresa_fornecedora_id, o_cotacao_id: @o_proposta.o_cotacao_id, o_status_id: @o_proposta.o_status_id, prazo_execucao_dias: @o_proposta.prazo_execucao_dias, usuario_envio_id: @o_proposta.usuario_envio_id, validade_proposta: @o_proposta.validade_proposta, valor_total: @o_proposta.valor_total, versao: @o_proposta.versao } }
    assert_redirected_to o_proposta_url(@o_proposta)
  end

  test "should destroy o_proposta" do
    assert_difference("OProposta.count", -1) do
      delete o_proposta_url(@o_proposta)
    end

    assert_redirected_to o_propostas_url
  end
end
