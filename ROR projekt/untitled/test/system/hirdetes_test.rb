require "application_system_test_case"

class HirdetesTest < ApplicationSystemTestCase
  setup do
    @hirdete = hirdetes(:one)
  end

  test "visiting the index" do
    visit hirdetes_url
    assert_selector "h1", text: "Hirdetes"
  end

  test "should create hirdete" do
    visit hirdetes_url
    click_on "New hirdete"

    fill_in "Ar kg", with: @hirdete.ar_kg
    fill_in "Mennyiseg", with: @hirdete.mennyiseg
    fill_in "Min vasarlas", with: @hirdete.min_vasarlas
    fill_in "Termek nev", with: @hirdete.termek_nev
    click_on "Create Hirdete"

    assert_text "Hirdete was successfully created"
    click_on "Back"
  end

  test "should update Hirdete" do
    visit hirdete_url(@hirdete)
    click_on "Edit this hirdete", match: :first

    fill_in "Ar kg", with: @hirdete.ar_kg
    fill_in "Mennyiseg", with: @hirdete.mennyiseg
    fill_in "Min vasarlas", with: @hirdete.min_vasarlas
    fill_in "Termek nev", with: @hirdete.termek_nev
    click_on "Update Hirdete"

    assert_text "Hirdete was successfully updated"
    click_on "Back"
  end

  test "should destroy Hirdete" do
    visit hirdete_url(@hirdete)
    click_on "Destroy this hirdete", match: :first

    assert_text "Hirdete was successfully destroyed"
  end
end
