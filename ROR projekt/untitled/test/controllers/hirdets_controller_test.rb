require "test_helper"

class HirdetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hirdet = hirdets(:one)
  end

  test "should get index" do
    get hirdets_url
    assert_response :success
  end

  test "should get new" do
    get new_hirdet_url
    assert_response :success
  end

  test "should create hirdet" do
    assert_difference("Hirdet.count") do
      post hirdets_url, params: { hirdet: { felhaszn_id: @hirdet.felhaszn_id, hirdetes_id: @hirdet.hirdetes_id, mikor: @hirdet.mikor } }
    end

    assert_redirected_to hirdet_url(Hirdet.last)
  end

  test "should show hirdet" do
    get hirdet_url(@hirdet)
    assert_response :success
  end

  test "should get edit" do
    get edit_hirdet_url(@hirdet)
    assert_response :success
  end

  test "should update hirdet" do
    patch hirdet_url(@hirdet), params: { hirdet: { felhaszn_id: @hirdet.felhaszn_id, hirdetes_id: @hirdet.hirdetes_id, mikor: @hirdet.mikor } }
    assert_redirected_to hirdet_url(@hirdet)
  end

  test "should destroy hirdet" do
    assert_difference("Hirdet.count", -1) do
      delete hirdet_url(@hirdet)
    end

    assert_redirected_to hirdets_url
  end
end
