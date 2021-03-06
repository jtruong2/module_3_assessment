require 'rails_helper'
RSpec.describe "search by location" do
  it "returns stores near zipcode" do
    # As a user
    # When I visit "/"
    visit root_path
    # And I fill in a search box with "80202" and click "search"
    fill_in :search, with: "80202"
    click_on "Search"
    # Then my current path should be "/search" (ignoring params)
    expect(current_path).to eq(search_path)
    # And I should see stores within 25 miles of 80202
    # expect(page).to have_content("Stores within 25 miles of 80202")
    # And I should see a message that says "17 Total Stores"
    expect(page).to have_content("17 total stores")

    # And I should see exactly 10 results (There are 17 stores within 25 miles. We want to display 10 on this page and 7 on the next. Get the first page to work first from start to finish and worry about pagination later.)
    within("ul") do
      expect(page).to have_css('li', count: 10)
      # And I should see the long name, city, distance, phone number and store type for each of the 10 results
      expect(page).to have_content("Cherry Creek Shopping Center")
      expect(page).to have_content("Denver")
      expect(page).to have_content("303-270-9189")
      expect(page).to have_content("3.45")
      expect(page).to have_content("Mobile SAS")
    end
  end
end
