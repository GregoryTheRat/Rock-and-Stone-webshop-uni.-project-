require "application_system_test_case"

class FelhasznalosTest < ApplicationSystemTestCase
  setup do
    @felhasznalo = felhasznalos(:one)
  end

  test "visiting the index" do
    visit felhasznalos_url
    assert_selector "h1", text: "Felhasznalos"
  end

  test "should create felhasznalo" do
    visit felhasznalos_url
    click_on "New felhasznalo"

    fill_in "Email", with: @felhasznalo.email
    fill_in "Jelszo", with: @felhasznalo.jelszo
    fill_in "Nev", with: @felhasznalo.nev
    click_on "Create Felhasznalo"

    assert_text "Felhasznalo was successfully created"
    click_on "Back"
  end

  test "should update Felhasznalo" do
    visit felhasznalo_url(@felhasznalo)
    click_on "Edit this felhasznalo", match: :first

    fill_in "Email", with: @felhasznalo.email
    fill_in "Jelszo", with: @felhasznalo.jelszo
    fill_in "Nev", with: @felhasznalo.nev
    click_on "Update Felhasznalo"

    assert_text "Felhasznalo was successfully updated"
    click_on "Back"
  end

  test "should destroy Felhasznalo" do
    visit felhasznalo_url(@felhasznalo)
    click_on "Destroy this felhasznalo", match: :first

    assert_text "Felhasznalo was successfully destroyed"
  end
end
