require "test_helper"

class OVisibilidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o_visibilidade = o_visibilidades(:one)
  end

  test "should get index" do
    get o_visibilidades_url
    assert_response :success
  end

  test "should get new" do
    get new_o_visibilidade_url
    assert_response :success
  end

  test "should create o_visibilidade" do
    assert_difference("OVisibilidade.count") do
      post o_visibilidades_url, params: { o_visibilidade: { descricao: @o_visibilidade.descricao } }
    end

    assert_redirected_to o_visibilidade_url(OVisibilidade.last)
  end

  test "should show o_visibilidade" do
    get o_visibilidade_url(@o_visibilidade)
    assert_response :success
  end

  test "should get edit" do
    get edit_o_visibilidade_url(@o_visibilidade)
    assert_response :success
  end

  test "should update o_visibilidade" do
    patch o_visibilidade_url(@o_visibilidade), params: { o_visibilidade: { descricao: @o_visibilidade.descricao } }
    assert_redirected_to o_visibilidade_url(@o_visibilidade)
  end

  test "should destroy o_visibilidade" do
    assert_difference("OVisibilidade.count", -1) do
      delete o_visibilidade_url(@o_visibilidade)
    end

    assert_redirected_to o_visibilidades_url
  end
end
