require "application_system_test_case"

class CarriesTest < ApplicationSystemTestCase
  setup do
    @carry = carries(:one)
  end

  test "visiting the index" do
    visit carries_url
    assert_selector "h1", text: "Carries"
  end

  test "should create carry" do
    visit carries_url
    click_on "New carry"

    fill_in "Mit", with: @carry.mit
    fill_in "Supplier", with: @carry.supplier_id
    click_on "Create Carry"

    assert_text "Carry was successfully created"
    click_on "Back"
  end

  test "should update Carry" do
    visit carry_url(@carry)
    click_on "Edit this carry", match: :first

    fill_in "Mit", with: @carry.mit
    fill_in "Supplier", with: @carry.supplier_id
    click_on "Update Carry"

    assert_text "Carry was successfully updated"
    click_on "Back"
  end

  test "should destroy Carry" do
    visit carry_url(@carry)
    click_on "Destroy this carry", match: :first

    assert_text "Carry was successfully destroyed"
  end
end
