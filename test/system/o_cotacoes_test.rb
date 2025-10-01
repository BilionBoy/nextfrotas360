require "application_system_test_case"

class OCotacaosTest < ApplicationSystemTestCase
  setup do
    @o_cotacao = o_cotacoes(:one)
  end

  test "visiting the index" do
    visit o_cotacoes_url
    assert_selector "h1", text: "O cotacaos"
  end

  test "should create o cotacao" do
    visit o_cotacoes_url
    click_on "New o cotacao"

    fill_in "Data expiracao", with: @o_cotacao.data_expiracao
    fill_in "O solicitacao", with: @o_cotacao.o_solicitacao_id
    fill_in "O status", with: @o_cotacao.o_status_id
    fill_in "O visibilidade", with: @o_cotacao.o_visibilidade_id
    click_on "Create O cotacao"

    assert_text "O cotacao was successfully created"
    click_on "Back"
  end

  test "should update O cotacao" do
    visit o_cotacao_url(@o_cotacao)
    click_on "Edit this o cotacao", match: :first

    fill_in "Data expiracao", with: @o_cotacao.data_expiracao.to_s
    fill_in "O solicitacao", with: @o_cotacao.o_solicitacao_id
    fill_in "O status", with: @o_cotacao.o_status_id
    fill_in "O visibilidade", with: @o_cotacao.o_visibilidade_id
    click_on "Update O cotacao"

    assert_text "O cotacao was successfully updated"
    click_on "Back"
  end

  test "should destroy O cotacao" do
    visit o_cotacao_url(@o_cotacao)
    click_on "Destroy this o cotacao", match: :first

    assert_text "O cotacao was successfully destroyed"
  end
end
