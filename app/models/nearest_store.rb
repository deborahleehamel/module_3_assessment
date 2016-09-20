class NearestStore
  attr_reader :id, :long_name, :city, :distance, :phone, :store_type,
              :name, :address, :state, :zipcode

  def initialize(data)
    @long_name  = data["longName"]
    @city       = data["city"]
    @distance   = data["distance"]
    @phone      = data["phone"]
    @store_type = data["storeType"]
    @id         = data["storeId"]
    @name       = data["name"]
    @address    = data["address"]
    @state      = data["region"]
    @zipcode    = data["postalCode"]
  end

  def self.service
    @@service = BestBuyService.new
  end

  def self.all(zipcode)
    raw_data = service.nearest_stores(zipcode)
    raw_data[:stores].map do |info|
      NearestStore.new(info)
    end
  end
end
