require "test_helper"

class AUsuariosPapeisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @a_usuario_papel = a_usuarios_papeis(:one)
  end

  test "should get index" do
    get a_usuarios_papeis_url
    assert_response :success
  end

  test "should get new" do
    get new_a_usuario_papel_url
    assert_response :success
  end

  test "should create a_usuario_papel" do
    assert_difference("AUsuarioPapel.count") do
      post a_usuarios_papeis_url, params: { a_usuario_papel: { a_papel_id: @a_usuario_papel.a_papel_id, a_unidade_id: @a_usuario_papel.a_unidade_id, user_id: @a_usuario_papel.user_id } }
    end

    assert_redirected_to a_usuario_papel_url(AUsuarioPapel.last)
  end

  test "should show a_usuario_papel" do
    get a_usuario_papel_url(@a_usuario_papel)
    assert_response :success
  end

  test "should get edit" do
    get edit_a_usuario_papel_url(@a_usuario_papel)
    assert_response :success
  end

  test "should update a_usuario_papel" do
    patch a_usuario_papel_url(@a_usuario_papel), params: { a_usuario_papel: { a_papel_id: @a_usuario_papel.a_papel_id, a_unidade_id: @a_usuario_papel.a_unidade_id, user_id: @a_usuario_papel.user_id } }
    assert_redirected_to a_usuario_papel_url(@a_usuario_papel)
  end

  test "should destroy a_usuario_papel" do
    assert_difference("AUsuarioPapel.count", -1) do
      delete a_usuario_papel_url(@a_usuario_papel)
    end

    assert_redirected_to a_usuarios_papeis_url
  end
end
