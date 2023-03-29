require "application_system_test_case"

class MitszallitsTest < ApplicationSystemTestCase
  setup do
    @mitszallit = mitszallits(:one)
  end

  test "visiting the index" do
    visit mitszallits_url
    assert_selector "h1", text: "Mitszallits"
  end

  test "should create mitszallit" do
    visit mitszallits_url
    click_on "New mitszallit"

    fill_in "Ar kg", with: @mitszallit.ar_kg
    fill_in "Mennyiseg", with: @mitszallit.mennyiseg
    fill_in "Min vasarlas", with: @mitszallit.min_vasarlas
    fill_in "Mit", with: @mitszallit.mit
    click_on "Create Mitszallit"

    assert_text "Mitszallit was successfully created"
    click_on "Back"
  end

  test "should update Mitszallit" do
    visit mitszallit_url(@mitszallit)
    click_on "Edit this mitszallit", match: :first

    fill_in "Ar kg", with: @mitszallit.ar_kg
    fill_in "Mennyiseg", with: @mitszallit.mennyiseg
    fill_in "Min vasarlas", with: @mitszallit.min_vasarlas
    fill_in "Mit", with: @mitszallit.mit
    click_on "Update Mitszallit"

    assert_text "Mitszallit was successfully updated"
    click_on "Back"
  end

  test "should destroy Mitszallit" do
    visit mitszallit_url(@mitszallit)
    click_on "Destroy this mitszallit", match: :first

    assert_text "Mitszallit was successfully destroyed"
  end
end
