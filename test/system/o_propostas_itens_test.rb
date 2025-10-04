require "application_system_test_case"

class OPropostaItemsTest < ApplicationSystemTestCase
  setup do
    @o_proposta_item = o_propostas_itens(:one)
  end

  test "visiting the index" do
    visit o_propostas_itens_url
    assert_selector "h1", text: "O proposta items"
  end

  test "should create o proposta item" do
    visit o_propostas_itens_url
    click_on "New o proposta item"

    fill_in "O cotacao", with: @o_proposta_item.o_cotacao_id
    fill_in "O cotacao item", with: @o_proposta_item.o_cotacao_item_id
    fill_in "Observacao", with: @o_proposta_item.observacao
    fill_in "Quantidade", with: @o_proposta_item.quantidade
    fill_in "Total item", with: @o_proposta_item.total_item
    fill_in "Valor unitario", with: @o_proposta_item.valor_unitario
    click_on "Create O proposta item"

    assert_text "O proposta item was successfully created"
    click_on "Back"
  end

  test "should update O proposta item" do
    visit o_proposta_item_url(@o_proposta_item)
    click_on "Edit this o proposta item", match: :first

    fill_in "O cotacao", with: @o_proposta_item.o_cotacao_id
    fill_in "O cotacao item", with: @o_proposta_item.o_cotacao_item_id
    fill_in "Observacao", with: @o_proposta_item.observacao
    fill_in "Quantidade", with: @o_proposta_item.quantidade
    fill_in "Total item", with: @o_proposta_item.total_item
    fill_in "Valor unitario", with: @o_proposta_item.valor_unitario
    click_on "Update O proposta item"

    assert_text "O proposta item was successfully updated"
    click_on "Back"
  end

  test "should destroy O proposta item" do
    visit o_proposta_item_url(@o_proposta_item)
    click_on "Destroy this o proposta item", match: :first

    assert_text "O proposta item was successfully destroyed"
  end
end
