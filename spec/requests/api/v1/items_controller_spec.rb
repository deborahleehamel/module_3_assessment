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
    items = JSON.parse(response.body)

    expect(items["name"]).to eq item.name
    expect(items["description"]).to eq item.description
    expect(items["image_url"]).to eq item.image_url
  end

  scenario "it deletes a single item" do
    item1 = items(:clock)
    item2 = items(:computer)

    expect(Item.count).to eq(2)

    delete "/api/v1/items/#{item1.id}"

    expect(Item.count).to eq(1)
  end

  scenario "it creates an item" do
    item_params = {name: "Chair", description: "good for sitting", image_url: "www.image.jpg"}

    expect(Item.count).to eq 2

    # post "/api/v1/items?name=Chair&description=comfy&image_url=www.image.jpg"
    post "api/v1/items", {item: item_params}

    items = JSON.parse(response.body)

    expect(response.status).to eq (201)

    expect(Item.count).to eq 3
    expect(items["name"]).to eq "Chair"
    expect(items["description"]).to eq "good for sitting"
    expect(items["image_url"]).to eq "www.image.jpg"
  end

end
