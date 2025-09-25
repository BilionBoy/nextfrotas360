require "test_helper"

class GTiposMovimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @g_tipo_movimento = g_tipos_movimentos(:one)
  end

  test "should get index" do
    get g_tipos_movimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_g_tipo_movimento_url
    assert_response :success
  end

  test "should create g_tipo_movimento" do
    assert_difference("GTipoMovimento.count") do
      post g_tipos_movimentos_url, params: { g_tipo_movimento: { descricao: @g_tipo_movimento.descricao } }
    end

    assert_redirected_to g_tipo_movimento_url(GTipoMovimento.last)
  end

  test "should show g_tipo_movimento" do
    get g_tipo_movimento_url(@g_tipo_movimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_g_tipo_movimento_url(@g_tipo_movimento)
    assert_response :success
  end

  test "should update g_tipo_movimento" do
    patch g_tipo_movimento_url(@g_tipo_movimento), params: { g_tipo_movimento: { descricao: @g_tipo_movimento.descricao } }
    assert_redirected_to g_tipo_movimento_url(@g_tipo_movimento)
  end

  test "should destroy g_tipo_movimento" do
    assert_difference("GTipoMovimento.count", -1) do
      delete g_tipo_movimento_url(@g_tipo_movimento)
    end

    assert_redirected_to g_tipos_movimentos_url
  end
end
