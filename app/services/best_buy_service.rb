class BestBuyService

  def initialize
    @_connection = Faraday.new("https://api.bestbuy.com")
  end

  def nearest_stores(zipcode)
    connection.params = {"format" => "json",
                         "apiKey" => ENV["BEST_BUY_API_KEY"],
                         "show" => "longName,city,distance,phone,storeType,storeId",
                        "pageSize" => "15"}
    response = parse(connection.get("/v1/stores(area(#{zipcode},25))"))
    # JSON.parse(response.body)
  end
end

private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    @_connection
  end
