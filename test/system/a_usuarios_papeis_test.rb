require "application_system_test_case"

class AUsuarioPapelsTest < ApplicationSystemTestCase
  setup do
    @a_usuario_papel = a_usuarios_papeis(:one)
  end

  test "visiting the index" do
    visit a_usuarios_papeis_url
    assert_selector "h1", text: "A usuario papels"
  end

  test "should create a usuario papel" do
    visit a_usuarios_papeis_url
    click_on "New a usuario papel"

    fill_in "A papel", with: @a_usuario_papel.a_papel_id
    fill_in "A unidade", with: @a_usuario_papel.a_unidade_id
    fill_in "User", with: @a_usuario_papel.user_id
    click_on "Create A usuario papel"

    assert_text "A usuario papel was successfully created"
    click_on "Back"
  end

  test "should update A usuario papel" do
    visit a_usuario_papel_url(@a_usuario_papel)
    click_on "Edit this a usuario papel", match: :first

    fill_in "A papel", with: @a_usuario_papel.a_papel_id
    fill_in "A unidade", with: @a_usuario_papel.a_unidade_id
    fill_in "User", with: @a_usuario_papel.user_id
    click_on "Update A usuario papel"

    assert_text "A usuario papel was successfully updated"
    click_on "Back"
  end

  test "should destroy A usuario papel" do
    visit a_usuario_papel_url(@a_usuario_papel)
    click_on "Destroy this a usuario papel", match: :first

    assert_text "A usuario papel was successfully destroyed"
  end
end
