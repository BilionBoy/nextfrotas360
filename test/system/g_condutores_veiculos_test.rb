require "application_system_test_case"

class GCondutorVeiculosTest < ApplicationSystemTestCase
  setup do
    @g_condutor_veiculo = g_condutores_veiculos(:one)
  end

  test "visiting the index" do
    visit g_condutores_veiculos_url
    assert_selector "h1", text: "G condutor veiculos"
  end

  test "should create g condutor veiculo" do
    visit g_condutores_veiculos_url
    click_on "New g condutor veiculo"

    fill_in "Data inicio", with: @g_condutor_veiculo.data_inicio
    fill_in "G condutor", with: @g_condutor_veiculo.g_condutor_id
    fill_in "G veiculo", with: @g_condutor_veiculo.g_veiculo_id
    click_on "Create G condutor veiculo"

    assert_text "G condutor veiculo was successfully created"
    click_on "Back"
  end

  test "should update G condutor veiculo" do
    visit g_condutor_veiculo_url(@g_condutor_veiculo)
    click_on "Edit this g condutor veiculo", match: :first

    fill_in "Data inicio", with: @g_condutor_veiculo.data_inicio
    fill_in "G condutor", with: @g_condutor_veiculo.g_condutor_id
    fill_in "G veiculo", with: @g_condutor_veiculo.g_veiculo_id
    click_on "Update G condutor veiculo"

    assert_text "G condutor veiculo was successfully updated"
    click_on "Back"
  end

  test "should destroy G condutor veiculo" do
    visit g_condutor_veiculo_url(@g_condutor_veiculo)
    click_on "Destroy this g condutor veiculo", match: :first

    assert_text "G condutor veiculo was successfully destroyed"
  end
end
