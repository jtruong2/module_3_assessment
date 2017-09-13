require 'rails_helper'
RSpec.describe "BestBuy Service" do
  it "returns stores within given zip" do
    stores = BestBuyService.search_by_zipcode("80202")

    expect(stores["total"]).to eq(17)
  end
end
