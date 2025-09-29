require "application_system_test_case"

class FEmpresaServicosTest < ApplicationSystemTestCase
  setup do
    @f_empresa_servico = f_empresas_servicos(:one)
  end

  test "visiting the index" do
    visit f_empresas_servicos_url
    assert_selector "h1", text: "F empresa servicos"
  end

  test "should create f empresa servico" do
    visit f_empresas_servicos_url
    click_on "New f empresa servico"

    fill_in "F empresa fornecedora", with: @f_empresa_servico.f_empresa_fornecedora_id
    fill_in "O categoria servico", with: @f_empresa_servico.o_categoria_servico_id
    click_on "Create F empresa servico"

    assert_text "F empresa servico was successfully created"
    click_on "Back"
  end

  test "should update F empresa servico" do
    visit f_empresa_servico_url(@f_empresa_servico)
    click_on "Edit this f empresa servico", match: :first

    fill_in "F empresa fornecedora", with: @f_empresa_servico.f_empresa_fornecedora_id
    fill_in "O categoria servico", with: @f_empresa_servico.o_categoria_servico_id
    click_on "Update F empresa servico"

    assert_text "F empresa servico was successfully updated"
    click_on "Back"
  end

  test "should destroy F empresa servico" do
    visit f_empresa_servico_url(@f_empresa_servico)
    click_on "Destroy this f empresa servico", match: :first

    assert_text "F empresa servico was successfully destroyed"
  end
end
