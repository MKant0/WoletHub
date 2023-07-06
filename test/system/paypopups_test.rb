require "application_system_test_case"

class PaypopupsTest < ApplicationSystemTestCase
  setup do
    @paypopup = paypopups(:one)
  end

  test "visiting the index" do
    visit paypopups_url
    assert_selector "h1", text: "Paypopups"
  end

  test "should create paypopup" do
    visit paypopups_url
    click_on "New paypopup"

    fill_in "Description", with: @paypopup.description
    fill_in "Name", with: @paypopup.name
    click_on "Create Paypopup"

    assert_text "Paypopup was successfully created"
    click_on "Back"
  end

  test "should update Paypopup" do
    visit paypopup_url(@paypopup)
    click_on "Edit this paypopup", match: :first

    fill_in "Description", with: @paypopup.description
    fill_in "Name", with: @paypopup.name
    click_on "Update Paypopup"

    assert_text "Paypopup was successfully updated"
    click_on "Back"
  end

  test "should destroy Paypopup" do
    visit paypopup_url(@paypopup)
    click_on "Destroy this paypopup", match: :first

    assert_text "Paypopup was successfully destroyed"
  end
end
