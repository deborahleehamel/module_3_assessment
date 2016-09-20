require 'rails_helper'

RSpec.describe "User can search for nearest locations" do
  it "displays store search results when zipcode entered" do
    # When I visit "/"
    visit "/"
    # And I fill in a search box with "80202" and click "search"
    fill_in("search", with: "80202")

    click_button "search"

    expect(current_path).to eq search_path

    # And I should see a message that says "17 Total Stores"
    expect(page).to have_content("17 total stores")

    # And I should see exactly 15 results
    expect(page).to have_selector('.store', count: 15)

    # And I should see the long name, city, distance, phone number and store type for each of the 15 results

    within(".nearest-stores") do
      expect(page).to have_content("Long Name")
      expect(page).to have_content("City")
      expect(page).to have_content("Distance")
      expect(page).to have_content("Phone Number")
      expect(page).to have_content("Store Type")
    end

  end
end
