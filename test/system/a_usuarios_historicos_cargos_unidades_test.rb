require "application_system_test_case"

class AUsuarioHistoricoCargoUnidadesTest < ApplicationSystemTestCase
  setup do
    @a_usuario_historico_cargo_unidade = a_usuarios_historicos_cargos_unidades(:one)
  end

  test "visiting the index" do
    visit a_usuarios_historicos_cargos_unidades_url
    assert_selector "h1", text: "A usuario historico cargo unidades"
  end

  test "should create a usuario historico cargo unidade" do
    visit a_usuarios_historicos_cargos_unidades_url
    click_on "New a usuario historico cargo unidade"

    fill_in "A cargo", with: @a_usuario_historico_cargo_unidade.a_cargo_id
    fill_in "A unidade", with: @a_usuario_historico_cargo_unidade.a_unidade_id
    fill_in "User", with: @a_usuario_historico_cargo_unidade.user_id
    click_on "Create A usuario historico cargo unidade"

    assert_text "A usuario historico cargo unidade was successfully created"
    click_on "Back"
  end

  test "should update A usuario historico cargo unidade" do
    visit a_usuario_historico_cargo_unidade_url(@a_usuario_historico_cargo_unidade)
    click_on "Edit this a usuario historico cargo unidade", match: :first

    fill_in "A cargo", with: @a_usuario_historico_cargo_unidade.a_cargo_id
    fill_in "A unidade", with: @a_usuario_historico_cargo_unidade.a_unidade_id
    fill_in "User", with: @a_usuario_historico_cargo_unidade.user_id
    click_on "Update A usuario historico cargo unidade"

    assert_text "A usuario historico cargo unidade was successfully updated"
    click_on "Back"
  end

  test "should destroy A usuario historico cargo unidade" do
    visit a_usuario_historico_cargo_unidade_url(@a_usuario_historico_cargo_unidade)
    click_on "Destroy this a usuario historico cargo unidade", match: :first

    assert_text "A usuario historico cargo unidade was successfully destroyed"
  end
end
