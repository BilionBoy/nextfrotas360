require "application_system_test_case"

class APapelPermissaosTest < ApplicationSystemTestCase
  setup do
    @a_papel_permissao = a_papeis_permissoes(:one)
  end

  test "visiting the index" do
    visit a_papeis_permissoes_url
    assert_selector "h1", text: "A papel permissaos"
  end

  test "should create a papel permissao" do
    visit a_papeis_permissoes_url
    click_on "New a papel permissao"

    fill_in "A papel", with: @a_papel_permissao.a_papel_id
    fill_in "A permissao", with: @a_papel_permissao.a_permissao_id
    click_on "Create A papel permissao"

    assert_text "A papel permissao was successfully created"
    click_on "Back"
  end

  test "should update A papel permissao" do
    visit a_papel_permissao_url(@a_papel_permissao)
    click_on "Edit this a papel permissao", match: :first

    fill_in "A papel", with: @a_papel_permissao.a_papel_id
    fill_in "A permissao", with: @a_papel_permissao.a_permissao_id
    click_on "Update A papel permissao"

    assert_text "A papel permissao was successfully updated"
    click_on "Back"
  end

  test "should destroy A papel permissao" do
    visit a_papel_permissao_url(@a_papel_permissao)
    click_on "Destroy this a papel permissao", match: :first

    assert_text "A papel permissao was successfully destroyed"
  end
end
