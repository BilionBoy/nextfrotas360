require "application_system_test_case"

class OVisibilidadesTest < ApplicationSystemTestCase
  setup do
    @o_visibilidade = o_visibilidades(:one)
  end

  test "visiting the index" do
    visit o_visibilidades_url
    assert_selector "h1", text: "O visibilidades"
  end

  test "should create o visibilidade" do
    visit o_visibilidades_url
    click_on "New o visibilidade"

    fill_in "Descricao", with: @o_visibilidade.descricao
    click_on "Create O visibilidade"

    assert_text "O visibilidade was successfully created"
    click_on "Back"
  end

  test "should update O visibilidade" do
    visit o_visibilidade_url(@o_visibilidade)
    click_on "Edit this o visibilidade", match: :first

    fill_in "Descricao", with: @o_visibilidade.descricao
    click_on "Update O visibilidade"

    assert_text "O visibilidade was successfully updated"
    click_on "Back"
  end

  test "should destroy O visibilidade" do
    visit o_visibilidade_url(@o_visibilidade)
    click_on "Destroy this o visibilidade", match: :first

    assert_text "O visibilidade was successfully destroyed"
  end
end
