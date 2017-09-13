class SearchStores
  def initialize(store)
    @name = store["longName"]
    @city = store["city"]
    @phone = store["phone"]
    @distance = store["distance"]
    @type = store["store_type"]
  end
end
