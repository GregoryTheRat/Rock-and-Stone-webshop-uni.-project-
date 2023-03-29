require "application_system_test_case"

class HirdetsTest < ApplicationSystemTestCase
  setup do
    @hirdet = hirdets(:one)
  end

  test "visiting the index" do
    visit hirdets_url
    assert_selector "h1", text: "Hirdets"
  end

  test "should create hirdet" do
    visit hirdets_url
    click_on "New hirdet"

    fill_in "Felhaszn", with: @hirdet.felhaszn_id
    fill_in "Hirdetes", with: @hirdet.hirdetes_id
    fill_in "Mikor", with: @hirdet.mikor
    click_on "Create Hirdet"

    assert_text "Hirdet was successfully created"
    click_on "Back"
  end

  test "should update Hirdet" do
    visit hirdet_url(@hirdet)
    click_on "Edit this hirdet", match: :first

    fill_in "Felhaszn", with: @hirdet.felhaszn_id
    fill_in "Hirdetes", with: @hirdet.hirdetes_id
    fill_in "Mikor", with: @hirdet.mikor
    click_on "Update Hirdet"

    assert_text "Hirdet was successfully updated"
    click_on "Back"
  end

  test "should destroy Hirdet" do
    visit hirdet_url(@hirdet)
    click_on "Destroy this hirdet", match: :first

    assert_text "Hirdet was successfully destroyed"
  end
end
