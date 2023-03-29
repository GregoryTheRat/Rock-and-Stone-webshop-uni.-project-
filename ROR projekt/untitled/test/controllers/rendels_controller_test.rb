require "test_helper"

class RendelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rendel = rendels(:one)
  end

  test "should get index" do
    get rendels_url
    assert_response :success
  end

  test "should get new" do
    get new_rendel_url
    assert_response :success
  end

  test "should create rendel" do
    assert_difference("Rendel.count") do
      post rendels_url, params: { rendel: { felhaszn_id: @rendel.felhaszn_id, hirdetes_id: @rendel.hirdetes_id, szallito_id: @rendel.szallito_id } }
    end

    assert_redirected_to rendel_url(Rendel.last)
  end

  test "should show rendel" do
    get rendel_url(@rendel)
    assert_response :success
  end

  test "should get edit" do
    get edit_rendel_url(@rendel)
    assert_response :success
  end

  test "should update rendel" do
    patch rendel_url(@rendel), params: { rendel: { felhaszn_id: @rendel.felhaszn_id, hirdetes_id: @rendel.hirdetes_id, szallito_id: @rendel.szallito_id } }
    assert_redirected_to rendel_url(@rendel)
  end

  test "should destroy rendel" do
    assert_difference("Rendel.count", -1) do
      delete rendel_url(@rendel)
    end

    assert_redirected_to rendels_url
  end
end
