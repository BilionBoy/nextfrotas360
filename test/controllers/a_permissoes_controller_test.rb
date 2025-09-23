require "test_helper"

class APermissoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @a_permissao = a_permissoes(:one)
  end

  test "should get index" do
    get a_permissoes_url
    assert_response :success
  end

  test "should get new" do
    get new_a_permissao_url
    assert_response :success
  end

  test "should create a_permissao" do
    assert_difference("APermissao.count") do
      post a_permissoes_url, params: { a_permissao: { acao: @a_permissao.acao, descricao: @a_permissao.descricao, nome: @a_permissao.nome, recurso: @a_permissao.recurso } }
    end

    assert_redirected_to a_permissao_url(APermissao.last)
  end

  test "should show a_permissao" do
    get a_permissao_url(@a_permissao)
    assert_response :success
  end

  test "should get edit" do
    get edit_a_permissao_url(@a_permissao)
    assert_response :success
  end

  test "should update a_permissao" do
    patch a_permissao_url(@a_permissao), params: { a_permissao: { acao: @a_permissao.acao, descricao: @a_permissao.descricao, nome: @a_permissao.nome, recurso: @a_permissao.recurso } }
    assert_redirected_to a_permissao_url(@a_permissao)
  end

  test "should destroy a_permissao" do
    assert_difference("APermissao.count", -1) do
      delete a_permissao_url(@a_permissao)
    end

    assert_redirected_to a_permissoes_url
  end
end
