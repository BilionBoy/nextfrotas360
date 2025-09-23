require "application_system_test_case"

class GTipoCentroCustosTest < ApplicationSystemTestCase
  setup do
    @g_tipo_centro_custo = g_tipos_centros_custos(:one)
  end

  test "visiting the index" do
    visit g_tipos_centros_custos_url
    assert_selector "h1", text: "G tipo centro custos"
  end

  test "should create g tipo centro custo" do
    visit g_tipos_centros_custos_url
    click_on "New g tipo centro custo"

    fill_in "Descricao", with: @g_tipo_centro_custo.descricao
    click_on "Create G tipo centro custo"

    assert_text "G tipo centro custo was successfully created"
    click_on "Back"
  end

  test "should update G tipo centro custo" do
    visit g_tipo_centro_custo_url(@g_tipo_centro_custo)
    click_on "Edit this g tipo centro custo", match: :first

    fill_in "Descricao", with: @g_tipo_centro_custo.descricao
    click_on "Update G tipo centro custo"

    assert_text "G tipo centro custo was successfully updated"
    click_on "Back"
  end

  test "should destroy G tipo centro custo" do
    visit g_tipo_centro_custo_url(@g_tipo_centro_custo)
    click_on "Destroy this g tipo centro custo", match: :first

    assert_text "G tipo centro custo was successfully destroyed"
  end
end
