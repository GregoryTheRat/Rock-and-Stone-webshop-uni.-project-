require "application_system_test_case"

class ErtekelsTest < ApplicationSystemTestCase
  setup do
    @ertekel = ertekels(:one)
  end

  test "visiting the index" do
    visit ertekels_url
    assert_selector "h1", text: "Ertekels"
  end

  test "should create ertekel" do
    visit ertekels_url
    click_on "New ertekel"

    fill_in "Csillag", with: @ertekel.csillag
    fill_in "Felhaszn", with: @ertekel.felhaszn_id
    fill_in "Hirdetes", with: @ertekel.hirdetes_id
    fill_in "Leiras", with: @ertekel.leiras
    click_on "Create Ertekel"

    assert_text "Ertekel was successfully created"
    click_on "Back"
  end

  test "should update Ertekel" do
    visit ertekel_url(@ertekel)
    click_on "Edit this ertekel", match: :first

    fill_in "Csillag", with: @ertekel.csillag
    fill_in "Felhaszn", with: @ertekel.felhaszn_id
    fill_in "Hirdetes", with: @ertekel.hirdetes_id
    fill_in "Leiras", with: @ertekel.leiras
    click_on "Update Ertekel"

    assert_text "Ertekel was successfully updated"
    click_on "Back"
  end

  test "should destroy Ertekel" do
    visit ertekel_url(@ertekel)
    click_on "Destroy this ertekel", match: :first

    assert_text "Ertekel was successfully destroyed"
  end
end
