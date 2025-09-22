require "test_helper"

class GStatusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @g_status = g_status(:one)
  end

  test "should get index" do
    get g_status_index_url
    assert_response :success
  end

  test "should get new" do
    get new_g_status_url
    assert_response :success
  end

  test "should create g_status" do
    assert_difference("GStatus.count") do
      post g_status_index_url, params: { g_status: { descricao: @g_status.descricao } }
    end

    assert_redirected_to g_status_url(GStatus.last)
  end

  test "should show g_status" do
    get g_status_url(@g_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_g_status_url(@g_status)
    assert_response :success
  end

  test "should update g_status" do
    patch g_status_url(@g_status), params: { g_status: { descricao: @g_status.descricao } }
    assert_redirected_to g_status_url(@g_status)
  end

  test "should destroy g_status" do
    assert_difference("GStatus.count", -1) do
      delete g_status_url(@g_status)
    end

    assert_redirected_to g_status_index_url
  end
end
