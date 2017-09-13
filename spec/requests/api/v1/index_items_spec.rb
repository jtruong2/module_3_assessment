require 'rails_helper'
RSpec.describe "GET /api/v1/items" do
  it "returns all items" do
    # When I send a GET request to `/api/v1/items`
    get '/api/v1/items'

    output = JSON.parse(response.body)
    # I receive a 200 JSON response containing all items
    expect(response).to eq(200)
    # And each item has an id, name, description, and image_url but not the created_at or updated_at
    expect(output.first["name"]).to eq("Heavy Duty Wooden Pants")
    expect(output.first["id"]).to eq(1)
    expect(output.first["description"]).to eq("Nihil corporis non nostrum possimus voluptatem aut rerum. Repellat autem error explicabo voluptas ut deleniti eveniet. Accusamus asperiores laborum et. Consequuntur et quos officiis in sunt inventore eum. Aliquid magni tenetur pariatur suscipit non.")
    expect(output.first["image_url"]).to eq("http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
    expect(output.first["created_at"]).to eq(nil)
    expect(output.first["updated_at"]).to eq(nil)
  end
end
# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted
#
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
# end
