require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first) # Reference to the first quote in the fixtures file
  end

  test "Creating a new quote" do
    # When I visit the Quotes#index page
    # we expect to see the text "Listing Quotes"
    # and the text "Quotes"
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # When I click on the "New Quote" link
    # we expect to see the title "New Quote"
    click_on "New Quote"
    fill_in "Name", with: "Capybara Quote"

    # When I fill in the name input with "Test Quote"
    # and I click on the "Create Quote" button
    assert_selector "h1", text: "Quotes"
    click_on "Create Quote"

    # we expect to be back on the page with the title "Quotes"
    # and to see our "Test Quote" in the list of quotes
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara Quote"
  end

  test "Showing a quote" do
    visit quotes_path
    click_on @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated Quote"
    
    click_on "Update Quote"
    assert_selector "h1", text: "Quotes"


    assert_selector "h1", text: "Quotes"
    assert_text "Updated Quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end