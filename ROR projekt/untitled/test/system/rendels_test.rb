require "application_system_test_case"

class RendelsTest < ApplicationSystemTestCase
  setup do
    @rendel = rendels(:one)
  end

  test "visiting the index" do
    visit rendels_url
    assert_selector "h1", text: "Rendels"
  end

  test "should create rendel" do
    visit rendels_url
    click_on "New rendel"

    fill_in "Felhaszn", with: @rendel.felhaszn_id
    fill_in "Hirdetes", with: @rendel.hirdetes_id
    fill_in "Szallito", with: @rendel.szallito_id
    click_on "Create Rendel"

    assert_text "Rendel was successfully created"
    click_on "Back"
  end

  test "should update Rendel" do
    visit rendel_url(@rendel)
    click_on "Edit this rendel", match: :first

    fill_in "Felhaszn", with: @rendel.felhaszn_id
    fill_in "Hirdetes", with: @rendel.hirdetes_id
    fill_in "Szallito", with: @rendel.szallito_id
    click_on "Update Rendel"

    assert_text "Rendel was successfully updated"
    click_on "Back"
  end

  test "should destroy Rendel" do
    visit rendel_url(@rendel)
    click_on "Destroy this rendel", match: :first

    assert_text "Rendel was successfully destroyed"
  end
end
