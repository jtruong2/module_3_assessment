class BestBuyService
  def initialize(zipcode)
    @zipcode = zipcode
  end

  def self.search_by_zipcode(zipcode)
    new(zipcode).search_by_zipcode
  end

  def search_by_zipcode
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{@zipcode},25))?format=json&show=storeId,storeType,longName,city,distance,phone&apiKey=#{ENV["API-KEY"]}")
    output = JSON.parse(response.body)
  end
end
