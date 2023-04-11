require "application_system_test_case"

class DeliversTest < ApplicationSystemTestCase
  setup do
    @deliver = delivers(:one)
  end

  test "visiting the index" do
    visit delivers_url
    assert_selector "h1", text: "Delivers"
  end

  test "should create deliver" do
    visit delivers_url
    click_on "New deliver"

    fill_in "Hova", with: @deliver.hova
    fill_in "Koltseg", with: @deliver.koltseg
    fill_in "Mennyiseg", with: @deliver.mennyiseg
    fill_in "Order", with: @deliver.order_id
    fill_in "Supplier", with: @deliver.supplier_id
    fill_in "Varhato szallitas", with: @deliver.varhato_szallitas
    click_on "Create Deliver"

    assert_text "Deliver was successfully created"
    click_on "Back"
  end

  test "should update Deliver" do
    visit deliver_url(@deliver)
    click_on "Edit this deliver", match: :first

    fill_in "Hova", with: @deliver.hova
    fill_in "Koltseg", with: @deliver.koltseg
    fill_in "Mennyiseg", with: @deliver.mennyiseg
    fill_in "Order", with: @deliver.order_id
    fill_in "Supplier", with: @deliver.supplier_id
    fill_in "Varhato szallitas", with: @deliver.varhato_szallitas
    click_on "Update Deliver"

    assert_text "Deliver was successfully updated"
    click_on "Back"
  end

  test "should destroy Deliver" do
    visit deliver_url(@deliver)
    click_on "Destroy this deliver", match: :first

    assert_text "Deliver was successfully destroyed"
  end
end
