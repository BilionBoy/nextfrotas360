require "application_system_test_case"

class GCategoriaCarteiraCondutorsTest < ApplicationSystemTestCase
  setup do
    @g_categoria_carteira_condutor = g_categorias_carteiras_condutores(:one)
  end

  test "visiting the index" do
    visit g_categorias_carteiras_condutores_url
    assert_selector "h1", text: "G categoria carteira condutors"
  end

  test "should create g categoria carteira condutor" do
    visit g_categorias_carteiras_condutores_url
    click_on "New g categoria carteira condutor"

    fill_in "Descricao", with: @g_categoria_carteira_condutor.descricao
    click_on "Create G categoria carteira condutor"

    assert_text "G categoria carteira condutor was successfully created"
    click_on "Back"
  end

  test "should update G categoria carteira condutor" do
    visit g_categoria_carteira_condutor_url(@g_categoria_carteira_condutor)
    click_on "Edit this g categoria carteira condutor", match: :first

    fill_in "Descricao", with: @g_categoria_carteira_condutor.descricao
    click_on "Update G categoria carteira condutor"

    assert_text "G categoria carteira condutor was successfully updated"
    click_on "Back"
  end

  test "should destroy G categoria carteira condutor" do
    visit g_categoria_carteira_condutor_url(@g_categoria_carteira_condutor)
    click_on "Destroy this g categoria carteira condutor", match: :first

    assert_text "G categoria carteira condutor was successfully destroyed"
  end
end
