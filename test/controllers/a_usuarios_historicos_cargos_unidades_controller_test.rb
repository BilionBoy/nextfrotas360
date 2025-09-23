require "test_helper"

class AUsuariosHistoricosCargosUnidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @a_usuario_historico_cargo_unidade = a_usuarios_historicos_cargos_unidades(:one)
  end

  test "should get index" do
    get a_usuarios_historicos_cargos_unidades_url
    assert_response :success
  end

  test "should get new" do
    get new_a_usuario_historico_cargo_unidade_url
    assert_response :success
  end

  test "should create a_usuario_historico_cargo_unidade" do
    assert_difference("AUsuarioHistoricoCargoUnidade.count") do
      post a_usuarios_historicos_cargos_unidades_url, params: { a_usuario_historico_cargo_unidade: { a_cargo_id: @a_usuario_historico_cargo_unidade.a_cargo_id, a_unidade_id: @a_usuario_historico_cargo_unidade.a_unidade_id, user_id: @a_usuario_historico_cargo_unidade.user_id } }
    end

    assert_redirected_to a_usuario_historico_cargo_unidade_url(AUsuarioHistoricoCargoUnidade.last)
  end

  test "should show a_usuario_historico_cargo_unidade" do
    get a_usuario_historico_cargo_unidade_url(@a_usuario_historico_cargo_unidade)
    assert_response :success
  end

  test "should get edit" do
    get edit_a_usuario_historico_cargo_unidade_url(@a_usuario_historico_cargo_unidade)
    assert_response :success
  end

  test "should update a_usuario_historico_cargo_unidade" do
    patch a_usuario_historico_cargo_unidade_url(@a_usuario_historico_cargo_unidade), params: { a_usuario_historico_cargo_unidade: { a_cargo_id: @a_usuario_historico_cargo_unidade.a_cargo_id, a_unidade_id: @a_usuario_historico_cargo_unidade.a_unidade_id, user_id: @a_usuario_historico_cargo_unidade.user_id } }
    assert_redirected_to a_usuario_historico_cargo_unidade_url(@a_usuario_historico_cargo_unidade)
  end

  test "should destroy a_usuario_historico_cargo_unidade" do
    assert_difference("AUsuarioHistoricoCargoUnidade.count", -1) do
      delete a_usuario_historico_cargo_unidade_url(@a_usuario_historico_cargo_unidade)
    end

    assert_redirected_to a_usuarios_historicos_cargos_unidades_url
  end
end
