require "test_helper"

class OStatusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o_status = o_status(:one)
  end

  test "should get index" do
    get o_status_index_url
    assert_response :success
  end

  test "should get new" do
    get new_o_status_url
    assert_response :success
  end

  test "should create o_status" do
    assert_difference("OStatus.count") do
      post o_status_index_url, params: { o_status: { descricao: @o_status.descricao } }
    end

    assert_redirected_to o_status_url(OStatus.last)
  end

  test "should show o_status" do
    get o_status_url(@o_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_o_status_url(@o_status)
    assert_response :success
  end

  test "should update o_status" do
    patch o_status_url(@o_status), params: { o_status: { descricao: @o_status.descricao } }
    assert_redirected_to o_status_url(@o_status)
  end

  test "should destroy o_status" do
    assert_difference("OStatus.count", -1) do
      delete o_status_url(@o_status)
    end

    assert_redirected_to o_status_index_url
  end
end
