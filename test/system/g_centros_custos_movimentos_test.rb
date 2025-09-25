require "application_system_test_case"

class GCentroCustoMovimentosTest < ApplicationSystemTestCase
  setup do
    @g_centro_custo_movimento = g_centros_custos_movimentos(:one)
  end

  test "visiting the index" do
    visit g_centros_custos_movimentos_url
    assert_selector "h1", text: "G centro custo movimentos"
  end

  test "should create g centro custo movimento" do
    visit g_centros_custos_movimentos_url
    click_on "New g centro custo movimento"

    fill_in "Descricao", with: @g_centro_custo_movimento.descricao
    fill_in "G centro custo", with: @g_centro_custo_movimento.g_centro_custo_id
    fill_in "G tipo movimento", with: @g_centro_custo_movimento.g_tipo_movimento_id
    fill_in "Referencia", with: @g_centro_custo_movimento.referencia_id
    fill_in "Referencia tipo", with: @g_centro_custo_movimento.referencia_tipo
    fill_in "Valor", with: @g_centro_custo_movimento.valor
    click_on "Create G centro custo movimento"

    assert_text "G centro custo movimento was successfully created"
    click_on "Back"
  end

  test "should update G centro custo movimento" do
    visit g_centro_custo_movimento_url(@g_centro_custo_movimento)
    click_on "Edit this g centro custo movimento", match: :first

    fill_in "Descricao", with: @g_centro_custo_movimento.descricao
    fill_in "G centro custo", with: @g_centro_custo_movimento.g_centro_custo_id
    fill_in "G tipo movimento", with: @g_centro_custo_movimento.g_tipo_movimento_id
    fill_in "Referencia", with: @g_centro_custo_movimento.referencia_id
    fill_in "Referencia tipo", with: @g_centro_custo_movimento.referencia_tipo
    fill_in "Valor", with: @g_centro_custo_movimento.valor
    click_on "Update G centro custo movimento"

    assert_text "G centro custo movimento was successfully updated"
    click_on "Back"
  end

  test "should destroy G centro custo movimento" do
    visit g_centro_custo_movimento_url(@g_centro_custo_movimento)
    click_on "Destroy this g centro custo movimento", match: :first

    assert_text "G centro custo movimento was successfully destroyed"
  end
end
