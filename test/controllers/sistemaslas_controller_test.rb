require 'test_helper'

class SistemaslasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sistemasla = sistemaslas(:one)
  end

  test "should get index" do
    get sistemaslas_url
    assert_response :success
  end

  test "should get new" do
    get new_sistemasla_url
    assert_response :success
  end

  test "should create sistemasla" do
    assert_difference('Sistemasla.count') do
      post sistemaslas_url, params: { sistemasla: { descricao: @sistemasla.descricao, gruposla_id: @sistemasla.gruposla_id, nome: @sistemasla.nome, slaaceitavel: @sistemasla.slaaceitavel } }
    end

    assert_redirected_to sistemasla_url(Sistemasla.last)
  end

  test "should show sistemasla" do
    get sistemasla_url(@sistemasla)
    assert_response :success
  end

  test "should get edit" do
    get edit_sistemasla_url(@sistemasla)
    assert_response :success
  end

  test "should update sistemasla" do
    patch sistemasla_url(@sistemasla), params: { sistemasla: { descricao: @sistemasla.descricao, gruposla_id: @sistemasla.gruposla_id, nome: @sistemasla.nome, slaaceitavel: @sistemasla.slaaceitavel } }
    assert_redirected_to sistemasla_url(@sistemasla)
  end

  test "should destroy sistemasla" do
    assert_difference('Sistemasla.count', -1) do
      delete sistemasla_url(@sistemasla)
    end

    assert_redirected_to sistemaslas_url
  end
end
