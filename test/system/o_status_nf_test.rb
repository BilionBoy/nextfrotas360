require "application_system_test_case"

class OStatusNfsTest < ApplicationSystemTestCase
  setup do
    @o_status_nf = o_status_nf(:one)
  end

  test "visiting the index" do
    visit o_status_nf_url
    assert_selector "h1", text: "O status nfs"
  end

  test "should create o status nf" do
    visit o_status_nf_url
    click_on "New o status nf"

    fill_in "Descricao", with: @o_status_nf.descricao
    click_on "Create O status nf"

    assert_text "O status nf was successfully created"
    click_on "Back"
  end

  test "should update O status nf" do
    visit o_status_nf_url(@o_status_nf)
    click_on "Edit this o status nf", match: :first

    fill_in "Descricao", with: @o_status_nf.descricao
    click_on "Update O status nf"

    assert_text "O status nf was successfully updated"
    click_on "Back"
  end

  test "should destroy O status nf" do
    visit o_status_nf_url(@o_status_nf)
    click_on "Destroy this o status nf", match: :first

    assert_text "O status nf was successfully destroyed"
  end
end
