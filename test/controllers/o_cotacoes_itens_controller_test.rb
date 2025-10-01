require "test_helper"

class OCotacoesItensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o_cotacao_item = o_cotacoes_itens(:one)
  end

  test "should get index" do
    get o_cotacoes_itens_url
    assert_response :success
  end

  test "should get new" do
    get new_o_cotacao_item_url
    assert_response :success
  end

  test "should create o_cotacao_item" do
    assert_difference("OCotacaoItem.count") do
      post o_cotacoes_itens_url, params: { o_cotacao_item: { descricao: @o_cotacao_item.descricao, o_categoria_servico_id: @o_cotacao_item.o_categoria_servico_id, o_cotacao_id: @o_cotacao_item.o_cotacao_id, quantidade: @o_cotacao_item.quantidade, valor_unitario: @o_cotacao_item.valor_unitario } }
    end

    assert_redirected_to o_cotacao_item_url(OCotacaoItem.last)
  end

  test "should show o_cotacao_item" do
    get o_cotacao_item_url(@o_cotacao_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_o_cotacao_item_url(@o_cotacao_item)
    assert_response :success
  end

  test "should update o_cotacao_item" do
    patch o_cotacao_item_url(@o_cotacao_item), params: { o_cotacao_item: { descricao: @o_cotacao_item.descricao, o_categoria_servico_id: @o_cotacao_item.o_categoria_servico_id, o_cotacao_id: @o_cotacao_item.o_cotacao_id, quantidade: @o_cotacao_item.quantidade, valor_unitario: @o_cotacao_item.valor_unitario } }
    assert_redirected_to o_cotacao_item_url(@o_cotacao_item)
  end

  test "should destroy o_cotacao_item" do
    assert_difference("OCotacaoItem.count", -1) do
      delete o_cotacao_item_url(@o_cotacao_item)
    end

    assert_redirected_to o_cotacoes_itens_url
  end
end
