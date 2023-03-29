require "application_system_test_case"

class SzallitosTest < ApplicationSystemTestCase
  setup do
    @szallito = szallitos(:one)
  end

  test "visiting the index" do
    visit szallitos_url
    assert_selector "h1", text: "Szallitos"
  end

  test "should create szallito" do
    visit szallitos_url
    click_on "New szallito"

    fill_in "Ar kg", with: @szallito.ar_kg
    fill_in "Km ar", with: @szallito.km_ar
    click_on "Create Szallito"

    assert_text "Szallito was successfully created"
    click_on "Back"
  end

  test "should update Szallito" do
    visit szallito_url(@szallito)
    click_on "Edit this szallito", match: :first

    fill_in "Ar kg", with: @szallito.ar_kg
    fill_in "Km ar", with: @szallito.km_ar
    click_on "Update Szallito"

    assert_text "Szallito was successfully updated"
    click_on "Back"
  end

  test "should destroy Szallito" do
    visit szallito_url(@szallito)
    click_on "Destroy this szallito", match: :first

    assert_text "Szallito was successfully destroyed"
  end
end
