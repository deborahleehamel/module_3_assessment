require "rails_helper"

RSpec.describe "GET #index" do
  fixtures :items
  scenario "returns all items" do
    item1 = items(:clock)
    item2 = items(:computer)

    get "api/v1/items"

    expect(response.status).to eq (200)

    items = JSON.parse(response.body)

    expect(items.count).to eq 2
    expect(items.first.keys).to eq ["name", "description", "image_url"]
  end
end
