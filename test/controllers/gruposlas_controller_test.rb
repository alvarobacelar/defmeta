require 'test_helper'

class GruposlasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gruposla = gruposlas(:one)
  end

  test "should get index" do
    get gruposlas_url
    assert_response :success
  end

  test "should get new" do
    get new_gruposla_url
    assert_response :success
  end

  test "should create gruposla" do
    assert_difference('Gruposla.count') do
      post gruposlas_url, params: { gruposla: { descricao: @gruposla.descricao, nome: @gruposla.nome, slaaceitavel: @gruposla.slaaceitavel } }
    end

    assert_redirected_to gruposla_url(Gruposla.last)
  end

  test "should show gruposla" do
    get gruposla_url(@gruposla)
    assert_response :success
  end

  test "should get edit" do
    get edit_gruposla_url(@gruposla)
    assert_response :success
  end

  test "should update gruposla" do
    patch gruposla_url(@gruposla), params: { gruposla: { descricao: @gruposla.descricao, nome: @gruposla.nome, slaaceitavel: @gruposla.slaaceitavel } }
    assert_redirected_to gruposla_url(@gruposla)
  end

  test "should destroy gruposla" do
    assert_difference('Gruposla.count', -1) do
      delete gruposla_url(@gruposla)
    end

    assert_redirected_to gruposlas_url
  end
end
