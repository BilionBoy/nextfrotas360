require "application_system_test_case"

class ACargosTest < ApplicationSystemTestCase
  setup do
    @a_cargo = a_cargos(:one)
  end

  test "visiting the index" do
    visit a_cargos_url
    assert_selector "h1", text: "A cargos"
  end

  test "should create a cargo" do
    visit a_cargos_url
    click_on "New a cargo"

    fill_in "A status", with: @a_cargo.a_status_id
    fill_in "Descricao", with: @a_cargo.descricao
    fill_in "Nivel", with: @a_cargo.nivel
    fill_in "Nome", with: @a_cargo.nome
    click_on "Create A cargo"

    assert_text "A cargo was successfully created"
    click_on "Back"
  end

  test "should update A cargo" do
    visit a_cargo_url(@a_cargo)
    click_on "Edit this a cargo", match: :first

    fill_in "A status", with: @a_cargo.a_status_id
    fill_in "Descricao", with: @a_cargo.descricao
    fill_in "Nivel", with: @a_cargo.nivel
    fill_in "Nome", with: @a_cargo.nome
    click_on "Update A cargo"

    assert_text "A cargo was successfully updated"
    click_on "Back"
  end

  test "should destroy A cargo" do
    visit a_cargo_url(@a_cargo)
    click_on "Destroy this a cargo", match: :first

    assert_text "A cargo was successfully destroyed"
  end
end
