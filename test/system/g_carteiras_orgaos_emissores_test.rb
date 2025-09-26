require "application_system_test_case"

class GCarteiraOrgaoEmissorsTest < ApplicationSystemTestCase
  setup do
    @g_carteira_orgao_emissor = g_carteiras_orgaos_emissores(:one)
  end

  test "visiting the index" do
    visit g_carteiras_orgaos_emissores_url
    assert_selector "h1", text: "G carteira orgao emissors"
  end

  test "should create g carteira orgao emissor" do
    visit g_carteiras_orgaos_emissores_url
    click_on "New g carteira orgao emissor"

    fill_in "Descricao", with: @g_carteira_orgao_emissor.descricao
    click_on "Create G carteira orgao emissor"

    assert_text "G carteira orgao emissor was successfully created"
    click_on "Back"
  end

  test "should update G carteira orgao emissor" do
    visit g_carteira_orgao_emissor_url(@g_carteira_orgao_emissor)
    click_on "Edit this g carteira orgao emissor", match: :first

    fill_in "Descricao", with: @g_carteira_orgao_emissor.descricao
    click_on "Update G carteira orgao emissor"

    assert_text "G carteira orgao emissor was successfully updated"
    click_on "Back"
  end

  test "should destroy G carteira orgao emissor" do
    visit g_carteira_orgao_emissor_url(@g_carteira_orgao_emissor)
    click_on "Destroy this g carteira orgao emissor", match: :first

    assert_text "G carteira orgao emissor was successfully destroyed"
  end
end
