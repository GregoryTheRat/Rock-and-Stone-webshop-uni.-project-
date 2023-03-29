require "test_helper"

class HirdetesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hirdete = hirdetes(:one)
  end

  test "should get index" do
    get hirdetes_url
    assert_response :success
  end

  test "should get new" do
    get new_hirdete_url
    assert_response :success
  end

  test "should create hirdete" do
    assert_difference("Hirdete.count") do
      post hirdetes_url, params: { hirdete: { ar_kg: @hirdete.ar_kg, mennyiseg: @hirdete.mennyiseg, min_vasarlas: @hirdete.min_vasarlas, termek_nev: @hirdete.termek_nev } }
    end

    assert_redirected_to hirdete_url(Hirdete.last)
  end

  test "should show hirdete" do
    get hirdete_url(@hirdete)
    assert_response :success
  end

  test "should get edit" do
    get edit_hirdete_url(@hirdete)
    assert_response :success
  end

  test "should update hirdete" do
    patch hirdete_url(@hirdete), params: { hirdete: { ar_kg: @hirdete.ar_kg, mennyiseg: @hirdete.mennyiseg, min_vasarlas: @hirdete.min_vasarlas, termek_nev: @hirdete.termek_nev } }
    assert_redirected_to hirdete_url(@hirdete)
  end

  test "should destroy hirdete" do
    assert_difference("Hirdete.count", -1) do
      delete hirdete_url(@hirdete)
    end

    assert_redirected_to hirdetes_url
  end
end
