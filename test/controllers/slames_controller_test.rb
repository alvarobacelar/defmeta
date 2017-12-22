require 'test_helper'

class SlamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @slame = slames(:one)
  end

  test "should get index" do
    get slames_url
    assert_response :success
  end

  test "should get new" do
    get new_slame_url
    assert_response :success
  end

  test "should create slame" do
    assert_difference('Slame.count') do
      post slames_url, params: { slame: { periodo: @slame.periodo, sistemasla_id: @slame.sistemasla_id, sla: @slame.sla } }
    end

    assert_redirected_to slame_url(Slame.last)
  end

  test "should show slame" do
    get slame_url(@slame)
    assert_response :success
  end

  test "should get edit" do
    get edit_slame_url(@slame)
    assert_response :success
  end

  test "should update slame" do
    patch slame_url(@slame), params: { slame: { periodo: @slame.periodo, sistemasla_id: @slame.sistemasla_id, sla: @slame.sla } }
    assert_redirected_to slame_url(@slame)
  end

  test "should destroy slame" do
    assert_difference('Slame.count', -1) do
      delete slame_url(@slame)
    end

    assert_redirected_to slames_url
  end
end
