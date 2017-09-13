class BestBuyService
  def initialize(zipcode)
    @zipcode = zipcode
    @conn = Faraday.new("https://api.bestbuy.com/")
  end

  def self.search_by_zipcode(zipcode)
    new(zipcode).search_by_zipcode
  end

  def search_by_zipcode
    response = @conn.get("v1/stores(area(#{@zipcode},25))?format=json&show=storeId,storeType,longName,city,distance,phone&,name&pageSize=2&apiKey=#{ENV["API-KEY"]}")
    output = JSON.parse(response)
    byebug
  end
end
