require 'test_helper'

class DificuldadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dificuldade = dificuldades(:one)
  end

  test "should get index" do
    get dificuldades_url
    assert_response :success
  end

  test "should get new" do
    get new_dificuldade_url
    assert_response :success
  end

  test "should create dificuldade" do
    assert_difference('Dificuldade.count') do
      post dificuldades_url, params: { dificuldade: { nome: @dificuldade.nome, status: @dificuldade.status, valor_dificuldade: @dificuldade.valor_dificuldade } }
    end

    assert_redirected_to dificuldade_url(Dificuldade.last)
  end

  test "should show dificuldade" do
    get dificuldade_url(@dificuldade)
    assert_response :success
  end

  test "should get edit" do
    get edit_dificuldade_url(@dificuldade)
    assert_response :success
  end

  test "should update dificuldade" do
    patch dificuldade_url(@dificuldade), params: { dificuldade: { nome: @dificuldade.nome, status: @dificuldade.status, valor_dificuldade: @dificuldade.valor_dificuldade } }
    assert_redirected_to dificuldade_url(@dificuldade)
  end

  test "should destroy dificuldade" do
    assert_difference('Dificuldade.count', -1) do
      delete dificuldade_url(@dificuldade)
    end

    assert_redirected_to dificuldades_url
  end
end
