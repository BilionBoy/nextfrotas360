require "application_system_test_case"

class OUrgenciaTest < ApplicationSystemTestCase
  setup do
    @o_urgencia = o_urgencias(:one)
  end

  test "visiting the index" do
    visit o_urgencias_url
    assert_selector "h1", text: "O urgencia"
  end

  test "should create o urgencia" do
    visit o_urgencias_url
    click_on "New o urgencia"

    fill_in "Descricao", with: @o_urgencia.descricao
    click_on "Create O urgencia"

    assert_text "O urgencia was successfully created"
    click_on "Back"
  end

  test "should update O urgencia" do
    visit o_urgencia_url(@o_urgencia)
    click_on "Edit this o urgencia", match: :first

    fill_in "Descricao", with: @o_urgencia.descricao
    click_on "Update O urgencia"

    assert_text "O urgencia was successfully updated"
    click_on "Back"
  end

  test "should destroy O urgencia" do
    visit o_urgencia_url(@o_urgencia)
    click_on "Destroy this o urgencia", match: :first

    assert_text "O urgencia was successfully destroyed"
  end
end
