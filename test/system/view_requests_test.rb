require "application_system_test_case"

class ViewRequestsTest < ApplicationSystemTestCase
  setup do
    @view_request = view_requests(:one)
  end

  test "visiting the index" do
    visit view_requests_url
    assert_selector "h1", text: "View Requests"
  end

  test "creating a View request" do
    visit view_requests_url
    click_on "New View Request"

    click_on "Create View request"

    assert_text "View request was successfully created"
    click_on "Back"
  end

  test "updating a View request" do
    visit view_requests_url
    click_on "Edit", match: :first

    click_on "Update View request"

    assert_text "View request was successfully updated"
    click_on "Back"
  end

  test "destroying a View request" do
    visit view_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "View request was successfully destroyed"
  end
end
