require "application_system_test_case"

class OStatusesTest < ApplicationSystemTestCase
  setup do
    @o_status = o_status(:one)
  end

  test "visiting the index" do
    visit o_status_url
    assert_selector "h1", text: "O statuses"
  end

  test "should create o status" do
    visit o_status_url
    click_on "New o status"

    fill_in "Descricao", with: @o_status.descricao
    click_on "Create O status"

    assert_text "O status was successfully created"
    click_on "Back"
  end

  test "should update O status" do
    visit o_status_url(@o_status)
    click_on "Edit this o status", match: :first

    fill_in "Descricao", with: @o_status.descricao
    click_on "Update O status"

    assert_text "O status was successfully updated"
    click_on "Back"
  end

  test "should destroy O status" do
    visit o_status_url(@o_status)
    click_on "Destroy this o status", match: :first

    assert_text "O status was successfully destroyed"
  end
end
