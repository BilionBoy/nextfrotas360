require "test_helper"

class OSolicitacoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o_solicitacao = o_solicitacoes(:one)
  end

  test "should get index" do
    get o_solicitacoes_url
    assert_response :success
  end

  test "should get new" do
    get new_o_solicitacao_url
    assert_response :success
  end

  test "should create o_solicitacao" do
    assert_difference("OSolicitacao.count") do
      post o_solicitacoes_url, params: { o_solicitacao: { data_limite_publicacao: @o_solicitacao.data_limite_publicacao, descricao: @o_solicitacao.descricao, g_centro_custo_id: @o_solicitacao.g_centro_custo_id, g_veiculo_id: @o_solicitacao.g_veiculo_id, km_reportado: @o_solicitacao.km_reportado, numero: @o_solicitacao.numero, o_categoria_servico_id: @o_solicitacao.o_categoria_servico_id, o_status_id: @o_solicitacao.o_status_id, o_tipo_solicitacao_id: @o_solicitacao.o_tipo_solicitacao_id, o_urgencia_id: @o_solicitacao.o_urgencia_id, publicado_em: @o_solicitacao.publicado_em, publicado_por_id: @o_solicitacao.publicado_por_id, saldo_snapshot: @o_solicitacao.saldo_snapshot, solicitante_id: @o_solicitacao.solicitante_id } }
    end

    assert_redirected_to o_solicitacao_url(OSolicitacao.last)
  end

  test "should show o_solicitacao" do
    get o_solicitacao_url(@o_solicitacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_o_solicitacao_url(@o_solicitacao)
    assert_response :success
  end

  test "should update o_solicitacao" do
    patch o_solicitacao_url(@o_solicitacao), params: { o_solicitacao: { data_limite_publicacao: @o_solicitacao.data_limite_publicacao, descricao: @o_solicitacao.descricao, g_centro_custo_id: @o_solicitacao.g_centro_custo_id, g_veiculo_id: @o_solicitacao.g_veiculo_id, km_reportado: @o_solicitacao.km_reportado, numero: @o_solicitacao.numero, o_categoria_servico_id: @o_solicitacao.o_categoria_servico_id, o_status_id: @o_solicitacao.o_status_id, o_tipo_solicitacao_id: @o_solicitacao.o_tipo_solicitacao_id, o_urgencia_id: @o_solicitacao.o_urgencia_id, publicado_em: @o_solicitacao.publicado_em, publicado_por_id: @o_solicitacao.publicado_por_id, saldo_snapshot: @o_solicitacao.saldo_snapshot, solicitante_id: @o_solicitacao.solicitante_id } }
    assert_redirected_to o_solicitacao_url(@o_solicitacao)
  end

  test "should destroy o_solicitacao" do
    assert_difference("OSolicitacao.count", -1) do
      delete o_solicitacao_url(@o_solicitacao)
    end

    assert_redirected_to o_solicitacoes_url
  end
end
