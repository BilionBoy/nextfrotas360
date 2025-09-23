require "application_system_test_case"

class OTipoSolicitacaosTest < ApplicationSystemTestCase
  setup do
    @o_tipo_solicitacao = o_tipos_solicitacoes(:one)
  end

  test "visiting the index" do
    visit o_tipos_solicitacoes_url
    assert_selector "h1", text: "O tipo solicitacaos"
  end

  test "should create o tipo solicitacao" do
    visit o_tipos_solicitacoes_url
    click_on "New o tipo solicitacao"

    fill_in "Descricao", with: @o_tipo_solicitacao.descricao
    click_on "Create O tipo solicitacao"

    assert_text "O tipo solicitacao was successfully created"
    click_on "Back"
  end

  test "should update O tipo solicitacao" do
    visit o_tipo_solicitacao_url(@o_tipo_solicitacao)
    click_on "Edit this o tipo solicitacao", match: :first

    fill_in "Descricao", with: @o_tipo_solicitacao.descricao
    click_on "Update O tipo solicitacao"

    assert_text "O tipo solicitacao was successfully updated"
    click_on "Back"
  end

  test "should destroy O tipo solicitacao" do
    visit o_tipo_solicitacao_url(@o_tipo_solicitacao)
    click_on "Destroy this o tipo solicitacao", match: :first

    assert_text "O tipo solicitacao was successfully destroyed"
  end
end
