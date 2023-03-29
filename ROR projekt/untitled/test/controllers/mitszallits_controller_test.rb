require "test_helper"

class MitszallitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mitszallit = mitszallits(:one)
  end

  test "should get index" do
    get mitszallits_url
    assert_response :success
  end

  test "should get new" do
    get new_mitszallit_url
    assert_response :success
  end

  test "should create mitszallit" do
    assert_difference("Mitszallit.count") do
      post mitszallits_url, params: { mitszallit: { ar_kg: @mitszallit.ar_kg, mennyiseg: @mitszallit.mennyiseg, min_vasarlas: @mitszallit.min_vasarlas, mit: @mitszallit.mit } }
    end

    assert_redirected_to mitszallit_url(Mitszallit.last)
  end

  test "should show mitszallit" do
    get mitszallit_url(@mitszallit)
    assert_response :success
  end

  test "should get edit" do
    get edit_mitszallit_url(@mitszallit)
    assert_response :success
  end

  test "should update mitszallit" do
    patch mitszallit_url(@mitszallit), params: { mitszallit: { ar_kg: @mitszallit.ar_kg, mennyiseg: @mitszallit.mennyiseg, min_vasarlas: @mitszallit.min_vasarlas, mit: @mitszallit.mit } }
    assert_redirected_to mitszallit_url(@mitszallit)
  end

  test "should destroy mitszallit" do
    assert_difference("Mitszallit.count", -1) do
      delete mitszallit_url(@mitszallit)
    end

    assert_redirected_to mitszallits_url
  end
end
