require "application_system_test_case"

class GTipoMovimentosTest < ApplicationSystemTestCase
  setup do
    @g_tipo_movimento = g_tipos_movimentos(:one)
  end

  test "visiting the index" do
    visit g_tipos_movimentos_url
    assert_selector "h1", text: "G tipo movimentos"
  end

  test "should create g tipo movimento" do
    visit g_tipos_movimentos_url
    click_on "New g tipo movimento"

    fill_in "Descricao", with: @g_tipo_movimento.descricao
    click_on "Create G tipo movimento"

    assert_text "G tipo movimento was successfully created"
    click_on "Back"
  end

  test "should update G tipo movimento" do
    visit g_tipo_movimento_url(@g_tipo_movimento)
    click_on "Edit this g tipo movimento", match: :first

    fill_in "Descricao", with: @g_tipo_movimento.descricao
    click_on "Update G tipo movimento"

    assert_text "G tipo movimento was successfully updated"
    click_on "Back"
  end

  test "should destroy G tipo movimento" do
    visit g_tipo_movimento_url(@g_tipo_movimento)
    click_on "Destroy this g tipo movimento", match: :first

    assert_text "G tipo movimento was successfully destroyed"
  end
end
