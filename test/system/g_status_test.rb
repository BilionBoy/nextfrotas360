require "application_system_test_case"

class GStatusesTest < ApplicationSystemTestCase
  setup do
    @g_status = g_status(:one)
  end

  test "visiting the index" do
    visit g_status_url
    assert_selector "h1", text: "G statuses"
  end

  test "should create g status" do
    visit g_status_url
    click_on "New g status"

    fill_in "Descricao", with: @g_status.descricao
    click_on "Create G status"

    assert_text "G status was successfully created"
    click_on "Back"
  end

  test "should update G status" do
    visit g_status_url(@g_status)
    click_on "Edit this g status", match: :first

    fill_in "Descricao", with: @g_status.descricao
    click_on "Update G status"

    assert_text "G status was successfully updated"
    click_on "Back"
  end

  test "should destroy G status" do
    visit g_status_url(@g_status)
    click_on "Destroy this g status", match: :first

    assert_text "G status was successfully destroyed"
  end
end
