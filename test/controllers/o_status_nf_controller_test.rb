require "test_helper"

class OStatusNfControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o_status_nf = o_status_nf(:one)
  end

  test "should get index" do
    get o_status_nf_index_url
    assert_response :success
  end

  test "should get new" do
    get new_o_status_nf_url
    assert_response :success
  end

  test "should create o_status_nf" do
    assert_difference("OStatusNf.count") do
      post o_status_nf_index_url, params: { o_status_nf: { descricao: @o_status_nf.descricao } }
    end

    assert_redirected_to o_status_nf_url(OStatusNf.last)
  end

  test "should show o_status_nf" do
    get o_status_nf_url(@o_status_nf)
    assert_response :success
  end

  test "should get edit" do
    get edit_o_status_nf_url(@o_status_nf)
    assert_response :success
  end

  test "should update o_status_nf" do
    patch o_status_nf_url(@o_status_nf), params: { o_status_nf: { descricao: @o_status_nf.descricao } }
    assert_redirected_to o_status_nf_url(@o_status_nf)
  end

  test "should destroy o_status_nf" do
    assert_difference("OStatusNf.count", -1) do
      delete o_status_nf_url(@o_status_nf)
    end

    assert_redirected_to o_status_nf_index_url
  end
end
