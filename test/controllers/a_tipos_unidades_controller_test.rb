require "test_helper"

class ATiposUnidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @a_tipo_unidade = a_tipos_unidades(:one)
  end

  test "should get index" do
    get a_tipos_unidades_url
    assert_response :success
  end

  test "should get new" do
    get new_a_tipo_unidade_url
    assert_response :success
  end

  test "should create a_tipo_unidade" do
    assert_difference("ATipoUnidade.count") do
      post a_tipos_unidades_url, params: { a_tipo_unidade: { descricao: @a_tipo_unidade.descricao } }
    end

    assert_redirected_to a_tipo_unidade_url(ATipoUnidade.last)
  end

  test "should show a_tipo_unidade" do
    get a_tipo_unidade_url(@a_tipo_unidade)
    assert_response :success
  end

  test "should get edit" do
    get edit_a_tipo_unidade_url(@a_tipo_unidade)
    assert_response :success
  end

  test "should update a_tipo_unidade" do
    patch a_tipo_unidade_url(@a_tipo_unidade), params: { a_tipo_unidade: { descricao: @a_tipo_unidade.descricao } }
    assert_redirected_to a_tipo_unidade_url(@a_tipo_unidade)
  end

  test "should destroy a_tipo_unidade" do
    assert_difference("ATipoUnidade.count", -1) do
      delete a_tipo_unidade_url(@a_tipo_unidade)
    end

    assert_redirected_to a_tipos_unidades_url
  end
end
