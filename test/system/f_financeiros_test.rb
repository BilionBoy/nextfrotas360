require "application_system_test_case"

class FFinanceirosTest < ApplicationSystemTestCase
  setup do
    @f_financeiro = f_financeiros(:one)
  end

  test "visiting the index" do
    visit f_financeiros_url
    assert_selector "h1", text: "F financeiros"
  end

  test "should create f financeiro" do
    visit f_financeiros_url
    click_on "New f financeiro"

    fill_in "F empresa fornecedora", with: @f_financeiro.f_empresa_fornecedora_id
    fill_in "O categoria servico", with: @f_financeiro.o_categoria_servico_id
    fill_in "Saldo disponivel", with: @f_financeiro.saldo_disponivel
    fill_in "Saldo reservado", with: @f_financeiro.saldo_reservado
    fill_in "Saldo total", with: @f_financeiro.saldo_total
    click_on "Create F financeiro"

    assert_text "F financeiro was successfully created"
    click_on "Back"
  end

  test "should update F financeiro" do
    visit f_financeiro_url(@f_financeiro)
    click_on "Edit this f financeiro", match: :first

    fill_in "F empresa fornecedora", with: @f_financeiro.f_empresa_fornecedora_id
    fill_in "O categoria servico", with: @f_financeiro.o_categoria_servico_id
    fill_in "Saldo disponivel", with: @f_financeiro.saldo_disponivel
    fill_in "Saldo reservado", with: @f_financeiro.saldo_reservado
    fill_in "Saldo total", with: @f_financeiro.saldo_total
    click_on "Update F financeiro"

    assert_text "F financeiro was successfully updated"
    click_on "Back"
  end

  test "should destroy F financeiro" do
    visit f_financeiro_url(@f_financeiro)
    click_on "Destroy this f financeiro", match: :first

    assert_text "F financeiro was successfully destroyed"
  end
end
