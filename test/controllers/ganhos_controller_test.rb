require 'test_helper'

class GanhosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ganho = ganhos(:one)
  end

  test "should get index" do
    get ganhos_url
    assert_response :success
  end

  test "should get new" do
    get new_ganho_url
    assert_response :success
  end

  test "should create ganho" do
    assert_difference('Ganho.count') do
      post ganhos_url, params: { ganho: { nome: @ganho.nome, status: @ganho.status, valor_ganho: @ganho.valor_ganho } }
    end

    assert_redirected_to ganho_url(Ganho.last)
  end

  test "should show ganho" do
    get ganho_url(@ganho)
    assert_response :success
  end

  test "should get edit" do
    get edit_ganho_url(@ganho)
    assert_response :success
  end

  test "should update ganho" do
    patch ganho_url(@ganho), params: { ganho: { nome: @ganho.nome, status: @ganho.status, valor_ganho: @ganho.valor_ganho } }
    assert_redirected_to ganho_url(@ganho)
  end

  test "should destroy ganho" do
    assert_difference('Ganho.count', -1) do
      delete ganho_url(@ganho)
    end

    assert_redirected_to ganhos_url
  end
end
