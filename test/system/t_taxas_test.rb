require "application_system_test_case"

class TTaxasTest < ApplicationSystemTestCase
  setup do
    @t_taxa = t_taxas(:one)
  end

  test "visiting the index" do
    visit t_taxas_url
    assert_selector "h1", text: "T taxas"
  end

  test "should create t taxa" do
    visit t_taxas_url
    click_on "New t taxa"

    fill_in "A status", with: @t_taxa.a_status_id
    fill_in "Descricao", with: @t_taxa.descricao
    fill_in "Nome", with: @t_taxa.nome
    fill_in "Percentual", with: @t_taxa.percentual
    click_on "Create T taxa"

    assert_text "T taxa was successfully created"
    click_on "Back"
  end

  test "should update T taxa" do
    visit t_taxa_url(@t_taxa)
    click_on "Edit this t taxa", match: :first

    fill_in "A status", with: @t_taxa.a_status_id
    fill_in "Descricao", with: @t_taxa.descricao
    fill_in "Nome", with: @t_taxa.nome
    fill_in "Percentual", with: @t_taxa.percentual
    click_on "Update T taxa"

    assert_text "T taxa was successfully updated"
    click_on "Back"
  end

  test "should destroy T taxa" do
    visit t_taxa_url(@t_taxa)
    click_on "Destroy this t taxa", match: :first

    assert_text "T taxa was successfully destroyed"
  end
end
