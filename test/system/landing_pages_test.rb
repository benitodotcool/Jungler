require "application_system_test_case"

class LandingPagesTest < ApplicationSystemTestCase
  setup do
    @landing_page = landing_pages(:one)
  end

  test "visiting the index" do
    visit landing_pages_url
    assert_selector "h1", text: "Landing Pages"
  end

  test "creating a Landing page" do
    visit landing_pages_url
    click_on "New Landing Page"

    click_on "Create Landing page"

    assert_text "Landing page was successfully created"
    click_on "Back"
  end

  test "updating a Landing page" do
    visit landing_pages_url
    click_on "Edit", match: :first

    click_on "Update Landing page"

    assert_text "Landing page was successfully updated"
    click_on "Back"
  end

  test "destroying a Landing page" do
    visit landing_pages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Landing page was successfully destroyed"
  end
end
