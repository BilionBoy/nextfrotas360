require "test_helper"

class APapeisPermissoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @a_papel_permissao = a_papeis_permissoes(:one)
  end

  test "should get index" do
    get a_papeis_permissoes_url
    assert_response :success
  end

  test "should get new" do
    get new_a_papel_permissao_url
    assert_response :success
  end

  test "should create a_papel_permissao" do
    assert_difference("APapelPermissao.count") do
      post a_papeis_permissoes_url, params: { a_papel_permissao: { a_papel_id: @a_papel_permissao.a_papel_id, a_permissao_id: @a_papel_permissao.a_permissao_id } }
    end

    assert_redirected_to a_papel_permissao_url(APapelPermissao.last)
  end

  test "should show a_papel_permissao" do
    get a_papel_permissao_url(@a_papel_permissao)
    assert_response :success
  end

  test "should get edit" do
    get edit_a_papel_permissao_url(@a_papel_permissao)
    assert_response :success
  end

  test "should update a_papel_permissao" do
    patch a_papel_permissao_url(@a_papel_permissao), params: { a_papel_permissao: { a_papel_id: @a_papel_permissao.a_papel_id, a_permissao_id: @a_papel_permissao.a_permissao_id } }
    assert_redirected_to a_papel_permissao_url(@a_papel_permissao)
  end

  test "should destroy a_papel_permissao" do
    assert_difference("APapelPermissao.count", -1) do
      delete a_papel_permissao_url(@a_papel_permissao)
    end

    assert_redirected_to a_papeis_permissoes_url
  end
end
