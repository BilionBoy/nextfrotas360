require "test_helper"

class ACargosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @a_cargo = a_cargos(:one)
  end

  test "should get index" do
    get a_cargos_url
    assert_response :success
  end

  test "should get new" do
    get new_a_cargo_url
    assert_response :success
  end

  test "should create a_cargo" do
    assert_difference("ACargo.count") do
      post a_cargos_url, params: { a_cargo: { a_status_id: @a_cargo.a_status_id, descricao: @a_cargo.descricao, nivel: @a_cargo.nivel, nome: @a_cargo.nome } }
    end

    assert_redirected_to a_cargo_url(ACargo.last)
  end

  test "should show a_cargo" do
    get a_cargo_url(@a_cargo)
    assert_response :success
  end

  test "should get edit" do
    get edit_a_cargo_url(@a_cargo)
    assert_response :success
  end

  test "should update a_cargo" do
    patch a_cargo_url(@a_cargo), params: { a_cargo: { a_status_id: @a_cargo.a_status_id, descricao: @a_cargo.descricao, nivel: @a_cargo.nivel, nome: @a_cargo.nome } }
    assert_redirected_to a_cargo_url(@a_cargo)
  end

  test "should destroy a_cargo" do
    assert_difference("ACargo.count", -1) do
      delete a_cargo_url(@a_cargo)
    end

    assert_redirected_to a_cargos_url
  end
end
