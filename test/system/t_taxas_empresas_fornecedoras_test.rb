require "application_system_test_case"

class TTaxaEmpresaFornecedorasTest < ApplicationSystemTestCase
  setup do
    @t_taxa_empresa_fornecedora = t_taxas_empresas_fornecedoras(:one)
  end

  test "visiting the index" do
    visit t_taxas_empresas_fornecedoras_url
    assert_selector "h1", text: "T taxa empresa fornecedoras"
  end

  test "should create t taxa empresa fornecedora" do
    visit t_taxas_empresas_fornecedoras_url
    click_on "New t taxa empresa fornecedora"

    fill_in "F empresa fornecedora", with: @t_taxa_empresa_fornecedora.f_empresa_fornecedora_id
    fill_in "T taxa", with: @t_taxa_empresa_fornecedora.t_taxa_id
    click_on "Create T taxa empresa fornecedora"

    assert_text "T taxa empresa fornecedora was successfully created"
    click_on "Back"
  end

  test "should update T taxa empresa fornecedora" do
    visit t_taxa_empresa_fornecedora_url(@t_taxa_empresa_fornecedora)
    click_on "Edit this t taxa empresa fornecedora", match: :first

    fill_in "F empresa fornecedora", with: @t_taxa_empresa_fornecedora.f_empresa_fornecedora_id
    fill_in "T taxa", with: @t_taxa_empresa_fornecedora.t_taxa_id
    click_on "Update T taxa empresa fornecedora"

    assert_text "T taxa empresa fornecedora was successfully updated"
    click_on "Back"
  end

  test "should destroy T taxa empresa fornecedora" do
    visit t_taxa_empresa_fornecedora_url(@t_taxa_empresa_fornecedora)
    click_on "Destroy this t taxa empresa fornecedora", match: :first

    assert_text "T taxa empresa fornecedora was successfully destroyed"
  end
end
