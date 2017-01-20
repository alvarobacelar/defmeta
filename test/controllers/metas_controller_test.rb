require 'test_helper'

class MetasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meta = metas(:one)
  end

  test "should get index" do
    get metas_url
    assert_response :success
  end

  test "should get new" do
    get new_meta_url
    assert_response :success
  end

  test "should create meta" do
    assert_difference('Meta.count') do
      post metas_url, params: { meta: { dificuldade_id: @meta.dificuldade_id, ganho_id: @meta.ganho_id, nome: @meta.nome, tipo_id: @meta.tipo_id, usuario_id: @meta.usuario_id } }
    end

    assert_redirected_to meta_url(Meta.last)
  end

  test "should show meta" do
    get meta_url(@meta)
    assert_response :success
  end

  test "should get edit" do
    get edit_meta_url(@meta)
    assert_response :success
  end

  test "should update meta" do
    patch meta_url(@meta), params: { meta: { dificuldade_id: @meta.dificuldade_id, ganho_id: @meta.ganho_id, nome: @meta.nome, tipo_id: @meta.tipo_id, usuario_id: @meta.usuario_id } }
    assert_redirected_to meta_url(@meta)
  end

  test "should destroy meta" do
    assert_difference('Meta.count', -1) do
      delete meta_url(@meta)
    end

    assert_redirected_to metas_url
  end
end
