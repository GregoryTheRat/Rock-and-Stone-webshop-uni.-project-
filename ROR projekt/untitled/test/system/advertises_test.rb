require "application_system_test_case"

class AdvertisesTest < ApplicationSystemTestCase
  setup do
    @advertise = advertises(:one)
  end

  test "visiting the index" do
    visit advertises_url
    assert_selector "h1", text: "Advertises"
  end

  test "should create advertise" do
    visit advertises_url
    click_on "New advertise"

    fill_in "Advert", with: @advertise.advert_id
    fill_in "Mikor", with: @advertise.mikor
    fill_in "User", with: @advertise.user_id
    click_on "Create Advertise"

    assert_text "Advertise was successfully created"
    click_on "Back"
  end

  test "should update Advertise" do
    visit advertise_url(@advertise)
    click_on "Edit this advertise", match: :first

    fill_in "Advert", with: @advertise.advert_id
    fill_in "Mikor", with: @advertise.mikor
    fill_in "User", with: @advertise.user_id
    click_on "Update Advertise"

    assert_text "Advertise was successfully updated"
    click_on "Back"
  end

  test "should destroy Advertise" do
    visit advertise_url(@advertise)
    click_on "Destroy this advertise", match: :first

    assert_text "Advertise was successfully destroyed"
  end
end
