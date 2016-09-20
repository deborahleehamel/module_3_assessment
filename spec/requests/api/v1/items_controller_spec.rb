require "rails_helper"

  describe "Api::V1::ItemsController" do
    fixtures :items
    scenario "returns all items" do
      item1 = items(:clock)
      item2 = items(:computer)

      get "/api/v1/items"
      # require "pry"; binding.pry
      expect(response.status).to eq (200)

      items = JSON.parse(response.body)

      expect(items.count).to eq 2
      expect(items.first.keys).to eq ["id", "name", "description", "image_url"]
    end

    scenario "returns a single item" do
    item = items(:clock)
    get "/api/v1/items/#{item.id}"

    expect(response.status).to eq (200)
    assert_response :success
    items = JSON.parse(response.body)

    expect(items["name"]).to eq item.name
    expect(items["description"]).to eq item.description
    expect(items["image_url"]).to eq item.image_url
  end
  end
