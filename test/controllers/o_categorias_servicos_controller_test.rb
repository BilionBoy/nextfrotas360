require "test_helper"

class OCategoriasServicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o_categoria_servico = o_categorias_servicos(:one)
  end

  test "should get index" do
    get o_categorias_servicos_url
    assert_response :success
  end

  test "should get new" do
    get new_o_categoria_servico_url
    assert_response :success
  end

  test "should create o_categoria_servico" do
    assert_difference("OCategoriaServico.count") do
      post o_categorias_servicos_url, params: { o_categoria_servico: { descricao: @o_categoria_servico.descricao } }
    end

    assert_redirected_to o_categoria_servico_url(OCategoriaServico.last)
  end

  test "should show o_categoria_servico" do
    get o_categoria_servico_url(@o_categoria_servico)
    assert_response :success
  end

  test "should get edit" do
    get edit_o_categoria_servico_url(@o_categoria_servico)
    assert_response :success
  end

  test "should update o_categoria_servico" do
    patch o_categoria_servico_url(@o_categoria_servico), params: { o_categoria_servico: { descricao: @o_categoria_servico.descricao } }
    assert_redirected_to o_categoria_servico_url(@o_categoria_servico)
  end

  test "should destroy o_categoria_servico" do
    assert_difference("OCategoriaServico.count", -1) do
      delete o_categoria_servico_url(@o_categoria_servico)
    end

    assert_redirected_to o_categorias_servicos_url
  end
end
