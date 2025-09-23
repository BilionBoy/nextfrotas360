require "test_helper"

class OUrgenciasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o_urgencia = o_urgencias(:one)
  end

  test "should get index" do
    get o_urgencias_url
    assert_response :success
  end

  test "should get new" do
    get new_o_urgencia_url
    assert_response :success
  end

  test "should create o_urgencia" do
    assert_difference("OUrgencia.count") do
      post o_urgencias_url, params: { o_urgencia: { descricao: @o_urgencia.descricao } }
    end

    assert_redirected_to o_urgencia_url(OUrgencia.last)
  end

  test "should show o_urgencia" do
    get o_urgencia_url(@o_urgencia)
    assert_response :success
  end

  test "should get edit" do
    get edit_o_urgencia_url(@o_urgencia)
    assert_response :success
  end

  test "should update o_urgencia" do
    patch o_urgencia_url(@o_urgencia), params: { o_urgencia: { descricao: @o_urgencia.descricao } }
    assert_redirected_to o_urgencia_url(@o_urgencia)
  end

  test "should destroy o_urgencia" do
    assert_difference("OUrgencia.count", -1) do
      delete o_urgencia_url(@o_urgencia)
    end

    assert_redirected_to o_urgencias_url
  end
end
