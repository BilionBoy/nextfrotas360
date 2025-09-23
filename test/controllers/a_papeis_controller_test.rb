require "test_helper"

class APapeisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @a_papel = a_papeis(:one)
  end

  test "should get index" do
    get a_papeis_url
    assert_response :success
  end

  test "should get new" do
    get new_a_papel_url
    assert_response :success
  end

  test "should create a_papel" do
    assert_difference("APapel.count") do
      post a_papeis_url, params: { a_papel: { a_status_id: @a_papel.a_status_id, descricao: @a_papel.descricao, nome: @a_papel.nome } }
    end

    assert_redirected_to a_papel_url(APapel.last)
  end

  test "should show a_papel" do
    get a_papel_url(@a_papel)
    assert_response :success
  end

  test "should get edit" do
    get edit_a_papel_url(@a_papel)
    assert_response :success
  end

  test "should update a_papel" do
    patch a_papel_url(@a_papel), params: { a_papel: { a_status_id: @a_papel.a_status_id, descricao: @a_papel.descricao, nome: @a_papel.nome } }
    assert_redirected_to a_papel_url(@a_papel)
  end

  test "should destroy a_papel" do
    assert_difference("APapel.count", -1) do
      delete a_papel_url(@a_papel)
    end

    assert_redirected_to a_papeis_url
  end
end
