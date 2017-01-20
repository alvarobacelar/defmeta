require 'test_helper'

class DetalhamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalhamento = detalhamentos(:one)
  end

  test "should get index" do
    get detalhamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_detalhamento_url
    assert_response :success
  end

  test "should create detalhamento" do
    assert_difference('Detalhamento.count') do
      post detalhamentos_url, params: { detalhamento: { item: @detalhamento.item, meta_id: @detalhamento.meta_id, status: @detalhamento.status } }
    end

    assert_redirected_to detalhamento_url(Detalhamento.last)
  end

  test "should show detalhamento" do
    get detalhamento_url(@detalhamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalhamento_url(@detalhamento)
    assert_response :success
  end

  test "should update detalhamento" do
    patch detalhamento_url(@detalhamento), params: { detalhamento: { item: @detalhamento.item, meta_id: @detalhamento.meta_id, status: @detalhamento.status } }
    assert_redirected_to detalhamento_url(@detalhamento)
  end

  test "should destroy detalhamento" do
    assert_difference('Detalhamento.count', -1) do
      delete detalhamento_url(@detalhamento)
    end

    assert_redirected_to detalhamentos_url
  end
end
