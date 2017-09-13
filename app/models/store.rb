class Store
  def self.search_by_zip(zipcode)
    BestBuyService.search_by_zipcode(zipcode)
  end
end
