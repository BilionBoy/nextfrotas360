require "application_system_test_case"

class FFinanceiroMovimentosTest < ApplicationSystemTestCase
  setup do
    @f_financeiro_movimento = f_financeiros_movimentos(:one)
  end

  test "visiting the index" do
    visit f_financeiros_movimentos_url
    assert_selector "h1", text: "F financeiro movimentos"
  end

  test "should create f financeiro movimento" do
    visit f_financeiros_movimentos_url
    click_on "New f financeiro movimento"

    fill_in "Descricao", with: @f_financeiro_movimento.descricao
    fill_in "F financeiro", with: @f_financeiro_movimento.f_financeiro_id
    fill_in "G tipo movimento", with: @f_financeiro_movimento.g_tipo_movimento_id
    fill_in "Observacao", with: @f_financeiro_movimento.observacao
    fill_in "Valor", with: @f_financeiro_movimento.valor
    click_on "Create F financeiro movimento"

    assert_text "F financeiro movimento was successfully created"
    click_on "Back"
  end

  test "should update F financeiro movimento" do
    visit f_financeiro_movimento_url(@f_financeiro_movimento)
    click_on "Edit this f financeiro movimento", match: :first

    fill_in "Descricao", with: @f_financeiro_movimento.descricao
    fill_in "F financeiro", with: @f_financeiro_movimento.f_financeiro_id
    fill_in "G tipo movimento", with: @f_financeiro_movimento.g_tipo_movimento_id
    fill_in "Observacao", with: @f_financeiro_movimento.observacao
    fill_in "Valor", with: @f_financeiro_movimento.valor
    click_on "Update F financeiro movimento"

    assert_text "F financeiro movimento was successfully updated"
    click_on "Back"
  end

  test "should destroy F financeiro movimento" do
    visit f_financeiro_movimento_url(@f_financeiro_movimento)
    click_on "Destroy this f financeiro movimento", match: :first

    assert_text "F financeiro movimento was successfully destroyed"
  end
end
