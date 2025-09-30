require "application_system_test_case"

class OSolicitacaosTest < ApplicationSystemTestCase
  setup do
    @o_solicitacao = o_solicitacoes(:one)
  end

  test "visiting the index" do
    visit o_solicitacoes_url
    assert_selector "h1", text: "O solicitacaos"
  end

  test "should create o solicitacao" do
    visit o_solicitacoes_url
    click_on "New o solicitacao"

    fill_in "Data limite publicacao", with: @o_solicitacao.data_limite_publicacao
    fill_in "Descricao", with: @o_solicitacao.descricao
    fill_in "G centro custo", with: @o_solicitacao.g_centro_custo_id
    fill_in "G veiculo", with: @o_solicitacao.g_veiculo_id
    fill_in "Km reportado", with: @o_solicitacao.km_reportado
    fill_in "Numero", with: @o_solicitacao.numero
    fill_in "O categoria servico", with: @o_solicitacao.o_categoria_servico_id
    fill_in "O status", with: @o_solicitacao.o_status_id
    fill_in "O tipo solicitacao", with: @o_solicitacao.o_tipo_solicitacao_id
    fill_in "O urgencia", with: @o_solicitacao.o_urgencia_id
    fill_in "Publicado em", with: @o_solicitacao.publicado_em
    fill_in "Publicado por", with: @o_solicitacao.publicado_por_id
    fill_in "Saldo snapshot", with: @o_solicitacao.saldo_snapshot
    fill_in "Solicitante", with: @o_solicitacao.solicitante_id
    click_on "Create O solicitacao"

    assert_text "O solicitacao was successfully created"
    click_on "Back"
  end

  test "should update O solicitacao" do
    visit o_solicitacao_url(@o_solicitacao)
    click_on "Edit this o solicitacao", match: :first

    fill_in "Data limite publicacao", with: @o_solicitacao.data_limite_publicacao.to_s
    fill_in "Descricao", with: @o_solicitacao.descricao
    fill_in "G centro custo", with: @o_solicitacao.g_centro_custo_id
    fill_in "G veiculo", with: @o_solicitacao.g_veiculo_id
    fill_in "Km reportado", with: @o_solicitacao.km_reportado
    fill_in "Numero", with: @o_solicitacao.numero
    fill_in "O categoria servico", with: @o_solicitacao.o_categoria_servico_id
    fill_in "O status", with: @o_solicitacao.o_status_id
    fill_in "O tipo solicitacao", with: @o_solicitacao.o_tipo_solicitacao_id
    fill_in "O urgencia", with: @o_solicitacao.o_urgencia_id
    fill_in "Publicado em", with: @o_solicitacao.publicado_em.to_s
    fill_in "Publicado por", with: @o_solicitacao.publicado_por_id
    fill_in "Saldo snapshot", with: @o_solicitacao.saldo_snapshot
    fill_in "Solicitante", with: @o_solicitacao.solicitante_id
    click_on "Update O solicitacao"

    assert_text "O solicitacao was successfully updated"
    click_on "Back"
  end

  test "should destroy O solicitacao" do
    visit o_solicitacao_url(@o_solicitacao)
    click_on "Destroy this o solicitacao", match: :first

    assert_text "O solicitacao was successfully destroyed"
  end
end
