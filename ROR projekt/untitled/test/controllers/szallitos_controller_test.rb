require "test_helper"

class SzallitosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @szallito = szallitos(:one)
  end

  test "should get index" do
    get szallitos_url
    assert_response :success
  end

  test "should get new" do
    get new_szallito_url
    assert_response :success
  end

  test "should create szallito" do
    assert_difference("Szallito.count") do
      post szallitos_url, params: { szallito: { ar_kg: @szallito.ar_kg, km_ar: @szallito.km_ar } }
    end

    assert_redirected_to szallito_url(Szallito.last)
  end

  test "should show szallito" do
    get szallito_url(@szallito)
    assert_response :success
  end

  test "should get edit" do
    get edit_szallito_url(@szallito)
    assert_response :success
  end

  test "should update szallito" do
    patch szallito_url(@szallito), params: { szallito: { ar_kg: @szallito.ar_kg, km_ar: @szallito.km_ar } }
    assert_redirected_to szallito_url(@szallito)
  end

  test "should destroy szallito" do
    assert_difference("Szallito.count", -1) do
      delete szallito_url(@szallito)
    end

    assert_redirected_to szallitos_url
  end
end
