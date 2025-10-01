require "application_system_test_case"

class OCotacaoItemsTest < ApplicationSystemTestCase
  setup do
    @o_cotacao_item = o_cotacoes_itens(:one)
  end

  test "visiting the index" do
    visit o_cotacoes_itens_url
    assert_selector "h1", text: "O cotacao items"
  end

  test "should create o cotacao item" do
    visit o_cotacoes_itens_url
    click_on "New o cotacao item"

    fill_in "Descricao", with: @o_cotacao_item.descricao
    fill_in "O categoria servico", with: @o_cotacao_item.o_categoria_servico_id
    fill_in "O cotacao", with: @o_cotacao_item.o_cotacao_id
    fill_in "Quantidade", with: @o_cotacao_item.quantidade
    fill_in "Valor unitario", with: @o_cotacao_item.valor_unitario
    click_on "Create O cotacao item"

    assert_text "O cotacao item was successfully created"
    click_on "Back"
  end

  test "should update O cotacao item" do
    visit o_cotacao_item_url(@o_cotacao_item)
    click_on "Edit this o cotacao item", match: :first

    fill_in "Descricao", with: @o_cotacao_item.descricao
    fill_in "O categoria servico", with: @o_cotacao_item.o_categoria_servico_id
    fill_in "O cotacao", with: @o_cotacao_item.o_cotacao_id
    fill_in "Quantidade", with: @o_cotacao_item.quantidade
    fill_in "Valor unitario", with: @o_cotacao_item.valor_unitario
    click_on "Update O cotacao item"

    assert_text "O cotacao item was successfully updated"
    click_on "Back"
  end

  test "should destroy O cotacao item" do
    visit o_cotacao_item_url(@o_cotacao_item)
    click_on "Destroy this o cotacao item", match: :first

    assert_text "O cotacao item was successfully destroyed"
  end
end
