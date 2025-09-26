require "application_system_test_case"

class GCondutorsTest < ApplicationSystemTestCase
  setup do
    @g_condutor = g_condutores(:one)
  end

  test "visiting the index" do
    visit g_condutores_url
    assert_selector "h1", text: "G condutors"
  end

  test "should create g condutor" do
    visit g_condutores_url
    click_on "New g condutor"

    fill_in "Cnh numero", with: @g_condutor.cnh_numero
    fill_in "Email", with: @g_condutor.email
    fill_in "G carteira orgao emissor", with: @g_condutor.g_carteira_orgao_emissor_id
    fill_in "G categoria carteira condutor", with: @g_condutor.g_categoria_carteira_condutor_id
    fill_in "G status", with: @g_condutor.g_status_id
    fill_in "Nome", with: @g_condutor.nome
    fill_in "Telefone", with: @g_condutor.telefone
    fill_in "Validace cnh", with: @g_condutor.validace_cnh
    click_on "Create G condutor"

    assert_text "G condutor was successfully created"
    click_on "Back"
  end

  test "should update G condutor" do
    visit g_condutor_url(@g_condutor)
    click_on "Edit this g condutor", match: :first

    fill_in "Cnh numero", with: @g_condutor.cnh_numero
    fill_in "Email", with: @g_condutor.email
    fill_in "G carteira orgao emissor", with: @g_condutor.g_carteira_orgao_emissor_id
    fill_in "G categoria carteira condutor", with: @g_condutor.g_categoria_carteira_condutor_id
    fill_in "G status", with: @g_condutor.g_status_id
    fill_in "Nome", with: @g_condutor.nome
    fill_in "Telefone", with: @g_condutor.telefone
    fill_in "Validace cnh", with: @g_condutor.validace_cnh.to_s
    click_on "Update G condutor"

    assert_text "G condutor was successfully updated"
    click_on "Back"
  end

  test "should destroy G condutor" do
    visit g_condutor_url(@g_condutor)
    click_on "Destroy this g condutor", match: :first

    assert_text "G condutor was successfully destroyed"
  end
end
