require "test_helper"

class FelhasznalosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @felhasznalo = felhasznalos(:one)
  end

  test "should get index" do
    get felhasznalos_url
    assert_response :success
  end

  test "should get new" do
    get new_felhasznalo_url
    assert_response :success
  end

  test "should create felhasznalo" do
    assert_difference("Felhasznalo.count") do
      post felhasznalos_url, params: { felhasznalo: { email: @felhasznalo.email, jelszo: @felhasznalo.jelszo, nev: @felhasznalo.nev } }
    end

    assert_redirected_to felhasznalo_url(Felhasznalo.last)
  end

  test "should show felhasznalo" do
    get felhasznalo_url(@felhasznalo)
    assert_response :success
  end

  test "should get edit" do
    get edit_felhasznalo_url(@felhasznalo)
    assert_response :success
  end

  test "should update felhasznalo" do
    patch felhasznalo_url(@felhasznalo), params: { felhasznalo: { email: @felhasznalo.email, jelszo: @felhasznalo.jelszo, nev: @felhasznalo.nev } }
    assert_redirected_to felhasznalo_url(@felhasznalo)
  end

  test "should destroy felhasznalo" do
    assert_difference("Felhasznalo.count", -1) do
      delete felhasznalo_url(@felhasznalo)
    end

    assert_redirected_to felhasznalos_url
  end
end
