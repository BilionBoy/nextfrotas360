require "application_system_test_case"

class ATipoUnidadesTest < ApplicationSystemTestCase
  setup do
    @a_tipo_unidade = a_tipos_unidades(:one)
  end

  test "visiting the index" do
    visit a_tipos_unidades_url
    assert_selector "h1", text: "A tipo unidades"
  end

  test "should create a tipo unidade" do
    visit a_tipos_unidades_url
    click_on "New a tipo unidade"

    fill_in "Descricao", with: @a_tipo_unidade.descricao
    click_on "Create A tipo unidade"

    assert_text "A tipo unidade was successfully created"
    click_on "Back"
  end

  test "should update A tipo unidade" do
    visit a_tipo_unidade_url(@a_tipo_unidade)
    click_on "Edit this a tipo unidade", match: :first

    fill_in "Descricao", with: @a_tipo_unidade.descricao
    click_on "Update A tipo unidade"

    assert_text "A tipo unidade was successfully updated"
    click_on "Back"
  end

  test "should destroy A tipo unidade" do
    visit a_tipo_unidade_url(@a_tipo_unidade)
    click_on "Destroy this a tipo unidade", match: :first

    assert_text "A tipo unidade was successfully destroyed"
  end
end
