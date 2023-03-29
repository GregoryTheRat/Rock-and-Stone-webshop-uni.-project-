require "test_helper"

class KiszallitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kiszallit = kiszallits(:one)
  end

  test "should get index" do
    get kiszallits_url
    assert_response :success
  end

  test "should get new" do
    get new_kiszallit_url
    assert_response :success
  end

  test "should create kiszallit" do
    assert_difference("Kiszallit.count") do
      post kiszallits_url, params: { kiszallit: { hova: @kiszallit.hova, koltseg: @kiszallit.koltseg, mennyiseg: @kiszallit.mennyiseg, rendel_id: @kiszallit.rendel_id, szallito_id: @kiszallit.szallito_id, varhato_szallitas: @kiszallit.varhato_szallitas } }
    end

    assert_redirected_to kiszallit_url(Kiszallit.last)
  end

  test "should show kiszallit" do
    get kiszallit_url(@kiszallit)
    assert_response :success
  end

  test "should get edit" do
    get edit_kiszallit_url(@kiszallit)
    assert_response :success
  end

  test "should update kiszallit" do
    patch kiszallit_url(@kiszallit), params: { kiszallit: { hova: @kiszallit.hova, koltseg: @kiszallit.koltseg, mennyiseg: @kiszallit.mennyiseg, rendel_id: @kiszallit.rendel_id, szallito_id: @kiszallit.szallito_id, varhato_szallitas: @kiszallit.varhato_szallitas } }
    assert_redirected_to kiszallit_url(@kiszallit)
  end

  test "should destroy kiszallit" do
    assert_difference("Kiszallit.count", -1) do
      delete kiszallit_url(@kiszallit)
    end

    assert_redirected_to kiszallits_url
  end
end
