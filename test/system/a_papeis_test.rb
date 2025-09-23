require "application_system_test_case"

class APapelsTest < ApplicationSystemTestCase
  setup do
    @a_papel = a_papeis(:one)
  end

  test "visiting the index" do
    visit a_papeis_url
    assert_selector "h1", text: "A papels"
  end

  test "should create a papel" do
    visit a_papeis_url
    click_on "New a papel"

    fill_in "A status", with: @a_papel.a_status_id
    fill_in "Descricao", with: @a_papel.descricao
    fill_in "Nome", with: @a_papel.nome
    click_on "Create A papel"

    assert_text "A papel was successfully created"
    click_on "Back"
  end

  test "should update A papel" do
    visit a_papel_url(@a_papel)
    click_on "Edit this a papel", match: :first

    fill_in "A status", with: @a_papel.a_status_id
    fill_in "Descricao", with: @a_papel.descricao
    fill_in "Nome", with: @a_papel.nome
    click_on "Update A papel"

    assert_text "A papel was successfully updated"
    click_on "Back"
  end

  test "should destroy A papel" do
    visit a_papel_url(@a_papel)
    click_on "Destroy this a papel", match: :first

    assert_text "A papel was successfully destroyed"
  end
end
