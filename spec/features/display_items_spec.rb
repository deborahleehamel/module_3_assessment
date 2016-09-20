require "rails_helper"

RSpec.feature "display all items" do
  scenario "reaches the root page" do
    visit "/"
    expect(page.status_code).to eq 200

    within('h1') do
      expect(page).to have_content("Items")
    end
  end
end
