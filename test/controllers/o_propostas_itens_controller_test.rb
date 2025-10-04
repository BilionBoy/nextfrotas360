require "test_helper"

class OPropostasItensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o_proposta_item = o_propostas_itens(:one)
  end

  test "should get index" do
    get o_propostas_itens_url
    assert_response :success
  end

  test "should get new" do
    get new_o_proposta_item_url
    assert_response :success
  end

  test "should create o_proposta_item" do
    assert_difference("OPropostaItem.count") do
      post o_propostas_itens_url, params: { o_proposta_item: { o_cotacao_id: @o_proposta_item.o_cotacao_id, o_cotacao_item_id: @o_proposta_item.o_cotacao_item_id, observacao: @o_proposta_item.observacao, quantidade: @o_proposta_item.quantidade, total_item: @o_proposta_item.total_item, valor_unitario: @o_proposta_item.valor_unitario } }
    end

    assert_redirected_to o_proposta_item_url(OPropostaItem.last)
  end

  test "should show o_proposta_item" do
    get o_proposta_item_url(@o_proposta_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_o_proposta_item_url(@o_proposta_item)
    assert_response :success
  end

  test "should update o_proposta_item" do
    patch o_proposta_item_url(@o_proposta_item), params: { o_proposta_item: { o_cotacao_id: @o_proposta_item.o_cotacao_id, o_cotacao_item_id: @o_proposta_item.o_cotacao_item_id, observacao: @o_proposta_item.observacao, quantidade: @o_proposta_item.quantidade, total_item: @o_proposta_item.total_item, valor_unitario: @o_proposta_item.valor_unitario } }
    assert_redirected_to o_proposta_item_url(@o_proposta_item)
  end

  test "should destroy o_proposta_item" do
    assert_difference("OPropostaItem.count", -1) do
      delete o_proposta_item_url(@o_proposta_item)
    end

    assert_redirected_to o_propostas_itens_url
  end
end
