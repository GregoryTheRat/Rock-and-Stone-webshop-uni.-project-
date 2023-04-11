require "application_system_test_case"

class AdvertsTest < ApplicationSystemTestCase
  setup do
    @advert = adverts(:one)
  end

  test "visiting the index" do
    visit adverts_url
    assert_selector "h1", text: "Adverts"
  end

  test "should create advert" do
    visit adverts_url
    click_on "New advert"

    fill_in "Ar kg", with: @advert.ar_kg
    fill_in "Mennyiseg", with: @advert.mennyiseg
    fill_in "Min vasarlas", with: @advert.min_vasarlas
    fill_in "Termek nev", with: @advert.termek_nev
    click_on "Create Advert"

    assert_text "Advert was successfully created"
    click_on "Back"
  end

  test "should update Advert" do
    visit advert_url(@advert)
    click_on "Edit this advert", match: :first

    fill_in "Ar kg", with: @advert.ar_kg
    fill_in "Mennyiseg", with: @advert.mennyiseg
    fill_in "Min vasarlas", with: @advert.min_vasarlas
    fill_in "Termek nev", with: @advert.termek_nev
    click_on "Update Advert"

    assert_text "Advert was successfully updated"
    click_on "Back"
  end

  test "should destroy Advert" do
    visit advert_url(@advert)
    click_on "Destroy this advert", match: :first

    assert_text "Advert was successfully destroyed"
  end
end
