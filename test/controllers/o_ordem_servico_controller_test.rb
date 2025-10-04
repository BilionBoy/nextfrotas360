require "test_helper"

class OOrdemServicoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get o_ordem_servico_index_url
    assert_response :success
  end

  test "should get show" do
    get o_ordem_servico_show_url
    assert_response :success
  end
end
