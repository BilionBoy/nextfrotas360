require "application_system_test_case"

class OCategoriaServicosTest < ApplicationSystemTestCase
  setup do
    @o_categoria_servico = o_categorias_servicos(:one)
  end

  test "visiting the index" do
    visit o_categorias_servicos_url
    assert_selector "h1", text: "O categoria servicos"
  end

  test "should create o categoria servico" do
    visit o_categorias_servicos_url
    click_on "New o categoria servico"

    fill_in "Descricao", with: @o_categoria_servico.descricao
    click_on "Create O categoria servico"

    assert_text "O categoria servico was successfully created"
    click_on "Back"
  end

  test "should update O categoria servico" do
    visit o_categoria_servico_url(@o_categoria_servico)
    click_on "Edit this o categoria servico", match: :first

    fill_in "Descricao", with: @o_categoria_servico.descricao
    click_on "Update O categoria servico"

    assert_text "O categoria servico was successfully updated"
    click_on "Back"
  end

  test "should destroy O categoria servico" do
    visit o_categoria_servico_url(@o_categoria_servico)
    click_on "Destroy this o categoria servico", match: :first

    assert_text "O categoria servico was successfully destroyed"
  end
end
