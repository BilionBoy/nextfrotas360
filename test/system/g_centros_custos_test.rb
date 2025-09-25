require "application_system_test_case"

class GCentroCustosTest < ApplicationSystemTestCase
  setup do
    @g_centro_custo = g_centros_custos(:one)
  end

  test "visiting the index" do
    visit g_centros_custos_url
    assert_selector "h1", text: "G centro custos"
  end

  test "should create g centro custo" do
    visit g_centros_custos_url
    click_on "New g centro custo"

    fill_in "A unidade", with: @g_centro_custo.a_unidade_id
    fill_in "Codigo dotacao", with: @g_centro_custo.codigo_dotacao
    fill_in "G tipo centro custo", with: @g_centro_custo.g_tipo_centro_custo_id
    fill_in "Nome", with: @g_centro_custo.nome
    fill_in "Saldo atual", with: @g_centro_custo.saldo_atual
    fill_in "Valor inicial", with: @g_centro_custo.valor_inicial
    click_on "Create G centro custo"

    assert_text "G centro custo was successfully created"
    click_on "Back"
  end

  test "should update G centro custo" do
    visit g_centro_custo_url(@g_centro_custo)
    click_on "Edit this g centro custo", match: :first

    fill_in "A unidade", with: @g_centro_custo.a_unidade_id
    fill_in "Codigo dotacao", with: @g_centro_custo.codigo_dotacao
    fill_in "G tipo centro custo", with: @g_centro_custo.g_tipo_centro_custo_id
    fill_in "Nome", with: @g_centro_custo.nome
    fill_in "Saldo atual", with: @g_centro_custo.saldo_atual
    fill_in "Valor inicial", with: @g_centro_custo.valor_inicial
    click_on "Update G centro custo"

    assert_text "G centro custo was successfully updated"
    click_on "Back"
  end

  test "should destroy G centro custo" do
    visit g_centro_custo_url(@g_centro_custo)
    click_on "Destroy this g centro custo", match: :first

    assert_text "G centro custo was successfully destroyed"
  end
end
