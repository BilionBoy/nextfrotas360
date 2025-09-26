require "application_system_test_case"

class FEmpresaFornecedorasTest < ApplicationSystemTestCase
  setup do
    @f_empresa_fornecedora = f_empresas_fornecedoras(:one)
  end

  test "visiting the index" do
    visit f_empresas_fornecedoras_url
    assert_selector "h1", text: "F empresa fornecedoras"
  end

  test "should create f empresa fornecedora" do
    visit f_empresas_fornecedoras_url
    click_on "New f empresa fornecedora"

    fill_in "A status", with: @f_empresa_fornecedora.a_status_id
    fill_in "Cnjp", with: @f_empresa_fornecedora.cnjp
    fill_in "Contato", with: @f_empresa_fornecedora.contato
    fill_in "Email", with: @f_empresa_fornecedora.email
    fill_in "Endereco", with: @f_empresa_fornecedora.endereco
    fill_in "G municipio", with: @f_empresa_fornecedora.g_municipio_id
    fill_in "Nome fantasia", with: @f_empresa_fornecedora.nome_fantasia
    fill_in "Razao social", with: @f_empresa_fornecedora.razao_social
    fill_in "Telefone", with: @f_empresa_fornecedora.telefone
    click_on "Create F empresa fornecedora"

    assert_text "F empresa fornecedora was successfully created"
    click_on "Back"
  end

  test "should update F empresa fornecedora" do
    visit f_empresa_fornecedora_url(@f_empresa_fornecedora)
    click_on "Edit this f empresa fornecedora", match: :first

    fill_in "A status", with: @f_empresa_fornecedora.a_status_id
    fill_in "Cnjp", with: @f_empresa_fornecedora.cnjp
    fill_in "Contato", with: @f_empresa_fornecedora.contato
    fill_in "Email", with: @f_empresa_fornecedora.email
    fill_in "Endereco", with: @f_empresa_fornecedora.endereco
    fill_in "G municipio", with: @f_empresa_fornecedora.g_municipio_id
    fill_in "Nome fantasia", with: @f_empresa_fornecedora.nome_fantasia
    fill_in "Razao social", with: @f_empresa_fornecedora.razao_social
    fill_in "Telefone", with: @f_empresa_fornecedora.telefone
    click_on "Update F empresa fornecedora"

    assert_text "F empresa fornecedora was successfully updated"
    click_on "Back"
  end

  test "should destroy F empresa fornecedora" do
    visit f_empresa_fornecedora_url(@f_empresa_fornecedora)
    click_on "Destroy this f empresa fornecedora", match: :first

    assert_text "F empresa fornecedora was successfully destroyed"
  end
end
