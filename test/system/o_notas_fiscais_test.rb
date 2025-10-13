require "application_system_test_case"

class ONotaFiscalsTest < ApplicationSystemTestCase
  setup do
    @o_nota_fiscal = o_notas_fiscais(:one)
  end

  test "visiting the index" do
    visit o_notas_fiscais_url
    assert_selector "h1", text: "O nota fiscals"
  end

  test "should create o nota fiscal" do
    visit o_notas_fiscais_url
    click_on "New o nota fiscal"

    fill_in "Data emissao", with: @o_nota_fiscal.data_emissao
    fill_in "Numero", with: @o_nota_fiscal.numero
    fill_in "O ordem servico", with: @o_nota_fiscal.o_ordem_servico_id
    fill_in "O status nf", with: @o_nota_fiscal.o_status_nf_id
    fill_in "Valor total", with: @o_nota_fiscal.valor_total
    click_on "Create O nota fiscal"

    assert_text "O nota fiscal was successfully created"
    click_on "Back"
  end

  test "should update O nota fiscal" do
    visit o_nota_fiscal_url(@o_nota_fiscal)
    click_on "Edit this o nota fiscal", match: :first

    fill_in "Data emissao", with: @o_nota_fiscal.data_emissao
    fill_in "Numero", with: @o_nota_fiscal.numero
    fill_in "O ordem servico", with: @o_nota_fiscal.o_ordem_servico_id
    fill_in "O status nf", with: @o_nota_fiscal.o_status_nf_id
    fill_in "Valor total", with: @o_nota_fiscal.valor_total
    click_on "Update O nota fiscal"

    assert_text "O nota fiscal was successfully updated"
    click_on "Back"
  end

  test "should destroy O nota fiscal" do
    visit o_nota_fiscal_url(@o_nota_fiscal)
    click_on "Destroy this o nota fiscal", match: :first

    assert_text "O nota fiscal was successfully destroyed"
  end
end
