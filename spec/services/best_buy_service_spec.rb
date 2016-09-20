require 'rails_helper'

RSpec.describe "best buy service" do
  scenario "gets nearest stores to a specific zipcode" do
    VCR.use_cassette("nearest_stores") do
      info = "longName", "city", "distance", "phone", "storeType", "storeId"

      service = BestBuyService.new

      results = service.nearest_stores("80202")

      expect(results["stores"].count).to eq 15
      expect(results["stores"].first.keys).to eq info
      expect(results["stores"].first).to eq({"longName"=>"Best Buy Mobile - Cherry Creek Shopping Center", "city"=>"Denver", "distance"=>3.25, "phone"=>"303-270-9189", "storeType"=>"Mobile", "storeId"=>2740})
    end
  end
end
