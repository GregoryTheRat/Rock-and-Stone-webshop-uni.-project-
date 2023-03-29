require "application_system_test_case"

class KiszallitsTest < ApplicationSystemTestCase
  setup do
    @kiszallit = kiszallits(:one)
  end

  test "visiting the index" do
    visit kiszallits_url
    assert_selector "h1", text: "Kiszallits"
  end

  test "should create kiszallit" do
    visit kiszallits_url
    click_on "New kiszallit"

    fill_in "Hova", with: @kiszallit.hova
    fill_in "Koltseg", with: @kiszallit.koltseg
    fill_in "Mennyiseg", with: @kiszallit.mennyiseg
    fill_in "Rendel", with: @kiszallit.rendel_id
    fill_in "Szallito", with: @kiszallit.szallito_id
    fill_in "Varhato szallitas", with: @kiszallit.varhato_szallitas
    click_on "Create Kiszallit"

    assert_text "Kiszallit was successfully created"
    click_on "Back"
  end

  test "should update Kiszallit" do
    visit kiszallit_url(@kiszallit)
    click_on "Edit this kiszallit", match: :first

    fill_in "Hova", with: @kiszallit.hova
    fill_in "Koltseg", with: @kiszallit.koltseg
    fill_in "Mennyiseg", with: @kiszallit.mennyiseg
    fill_in "Rendel", with: @kiszallit.rendel_id
    fill_in "Szallito", with: @kiszallit.szallito_id
    fill_in "Varhato szallitas", with: @kiszallit.varhato_szallitas
    click_on "Update Kiszallit"

    assert_text "Kiszallit was successfully updated"
    click_on "Back"
  end

  test "should destroy Kiszallit" do
    visit kiszallit_url(@kiszallit)
    click_on "Destroy this kiszallit", match: :first

    assert_text "Kiszallit was successfully destroyed"
  end
end
