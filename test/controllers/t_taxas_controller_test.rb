require "test_helper"

class TTaxasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_taxa = t_taxas(:one)
  end

  test "should get index" do
    get t_taxas_url
    assert_response :success
  end

  test "should get new" do
    get new_t_taxa_url
    assert_response :success
  end

  test "should create t_taxa" do
    assert_difference("TTaxa.count") do
      post t_taxas_url, params: { t_taxa: { a_status_id: @t_taxa.a_status_id, descricao: @t_taxa.descricao, nome: @t_taxa.nome, percentual: @t_taxa.percentual } }
    end

    assert_redirected_to t_taxa_url(TTaxa.last)
  end

  test "should show t_taxa" do
    get t_taxa_url(@t_taxa)
    assert_response :success
  end

  test "should get edit" do
    get edit_t_taxa_url(@t_taxa)
    assert_response :success
  end

  test "should update t_taxa" do
    patch t_taxa_url(@t_taxa), params: { t_taxa: { a_status_id: @t_taxa.a_status_id, descricao: @t_taxa.descricao, nome: @t_taxa.nome, percentual: @t_taxa.percentual } }
    assert_redirected_to t_taxa_url(@t_taxa)
  end

  test "should destroy t_taxa" do
    assert_difference("TTaxa.count", -1) do
      delete t_taxa_url(@t_taxa)
    end

    assert_redirected_to t_taxas_url
  end
end
