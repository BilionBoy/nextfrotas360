require "application_system_test_case"

class APermissaosTest < ApplicationSystemTestCase
  setup do
    @a_permissao = a_permissoes(:one)
  end

  test "visiting the index" do
    visit a_permissoes_url
    assert_selector "h1", text: "A permissaos"
  end

  test "should create a permissao" do
    visit a_permissoes_url
    click_on "New a permissao"

    fill_in "Acao", with: @a_permissao.acao
    fill_in "Descricao", with: @a_permissao.descricao
    fill_in "Nome", with: @a_permissao.nome
    fill_in "Recurso", with: @a_permissao.recurso
    click_on "Create A permissao"

    assert_text "A permissao was successfully created"
    click_on "Back"
  end

  test "should update A permissao" do
    visit a_permissao_url(@a_permissao)
    click_on "Edit this a permissao", match: :first

    fill_in "Acao", with: @a_permissao.acao
    fill_in "Descricao", with: @a_permissao.descricao
    fill_in "Nome", with: @a_permissao.nome
    fill_in "Recurso", with: @a_permissao.recurso
    click_on "Update A permissao"

    assert_text "A permissao was successfully updated"
    click_on "Back"
  end

  test "should destroy A permissao" do
    visit a_permissao_url(@a_permissao)
    click_on "Destroy this a permissao", match: :first

    assert_text "A permissao was successfully destroyed"
  end
end
