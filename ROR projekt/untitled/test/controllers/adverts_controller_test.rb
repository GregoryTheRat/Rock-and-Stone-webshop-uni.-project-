require "test_helper"

class AdvertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @advert = adverts(:one)
  end

  test "should get index" do
    get adverts_url
    assert_response :success
  end

  test "should get new" do
    get new_advert_url
    assert_response :success
  end

  test "should create advert" do
    assert_difference("Advert.count") do
      post adverts_url, params: { advert: { ar_kg: @advert.ar_kg, mennyiseg: @advert.mennyiseg, min_vasarlas: @advert.min_vasarlas, termek_nev: @advert.termek_nev } }
    end

    assert_redirected_to advert_url(Advert.last)
  end

  test "should show advert" do
    get advert_url(@advert)
    assert_response :success
  end

  test "should get edit" do
    get edit_advert_url(@advert)
    assert_response :success
  end

  test "should update advert" do
    patch advert_url(@advert), params: { advert: { ar_kg: @advert.ar_kg, mennyiseg: @advert.mennyiseg, min_vasarlas: @advert.min_vasarlas, termek_nev: @advert.termek_nev } }
    assert_redirected_to advert_url(@advert)
  end

  test "should destroy advert" do
    assert_difference("Advert.count", -1) do
      delete advert_url(@advert)
    end

    assert_redirected_to adverts_url
  end
end
