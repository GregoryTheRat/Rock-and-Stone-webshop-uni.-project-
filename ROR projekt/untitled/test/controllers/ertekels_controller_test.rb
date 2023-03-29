require "test_helper"

class ErtekelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ertekel = ertekels(:one)
  end

  test "should get index" do
    get ertekels_url
    assert_response :success
  end

  test "should get new" do
    get new_ertekel_url
    assert_response :success
  end

  test "should create ertekel" do
    assert_difference("Ertekel.count") do
      post ertekels_url, params: { ertekel: { csillag: @ertekel.csillag, felhaszn_id: @ertekel.felhaszn_id, hirdetes_id: @ertekel.hirdetes_id, leiras: @ertekel.leiras } }
    end

    assert_redirected_to ertekel_url(Ertekel.last)
  end

  test "should show ertekel" do
    get ertekel_url(@ertekel)
    assert_response :success
  end

  test "should get edit" do
    get edit_ertekel_url(@ertekel)
    assert_response :success
  end

  test "should update ertekel" do
    patch ertekel_url(@ertekel), params: { ertekel: { csillag: @ertekel.csillag, felhaszn_id: @ertekel.felhaszn_id, hirdetes_id: @ertekel.hirdetes_id, leiras: @ertekel.leiras } }
    assert_redirected_to ertekel_url(@ertekel)
  end

  test "should destroy ertekel" do
    assert_difference("Ertekel.count", -1) do
      delete ertekel_url(@ertekel)
    end

    assert_redirected_to ertekels_url
  end
end
