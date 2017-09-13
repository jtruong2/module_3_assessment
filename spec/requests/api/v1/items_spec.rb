require 'rails_helper'
RSpec.describe "items api" do
  it "returns all items" do
    create_list(:item, 3)
    # When I send a GET request to `/api/v1/items`
    get "/api/v1/items"

    output = JSON.parse(response.body)
    # I receive a 200 JSON response containing all items
    expect(response).to be_success
    # And each item has an id, name, description, and image_url but not the created_at or updated_at
    expect(output.first["name"]).to eq("Heavy Duty Wooden Pants")
    expect(output.first["id"]).to eq(1)
    expect(output.first["description"]).to eq("Nihil corporis non nostrum possimus voluptatem aut rerum. Repellat autem error explicabo voluptas ut deleniti eveniet. Accusamus asperiores laborum et. Consequuntur et quos officiis in sunt inventore eum. Aliquid magni tenetur pariatur suscipit non.")
    expect(output.first["image_url"]).to eq("http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
    expect(output.first["created_at"]).to eq(nil)
    expect(output.first["updated_at"]).to eq(nil)
  end

  it "returns one specific item" do
    item = create(:item)
    # When I send a GET request to `/api/v1/items/1`
    get "/api/v1/items/#{item.id}"

    output = JSON.parse(response.body)
    # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    expect(response).to be_success
    expect(output["id"]).to eq(item.id)
    expect(output["name"]).to eq(item.name)
    expect(output["description"]).to eq(item.description)
    expect(output["image_url"]).to eq(item.image_url)
    expect(output["created_at"]).to eq(nil)
    expect(output["created_at"]).to eq(nil)
  end

  it "deletes a specific item" do
    item = create(:item)
    item2 = create(:item)
    # When I send a DELETE request to `/api/v1/items/1`
    delete "/api/v1/items/#{item.id}"
    # I receive a 204 JSON response if the record is successfully deleted
    output = JSON.parse(response.body)

    expect(response).to be_success
    expect(output.first["id"]).to_not eq(item.id)
  end

  it "creates a new item" do
    item = build(:item)
    # When I send a POST request to `/api/v1/items` with a name, description, and image_url
    post "/api/v1/items?name=#{item.name}&description=#{item.description}&image_url=#{item.image_url}"

    output = JSON.parse(response.body)
    # I receive a 201 JSON  response if the record is successfully created
    expect(response.to be_success)
    # And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    expect(output["id"]).to eq(item.id)
    expect(output["name"]).to eq(item.name)
    expect(output["description"]).to eq(item.description)
    expect(output["image_url"]).to eq(item.image_url)
    expect(output["created_at"]).to eq(nil)
    expect(output["updated_at"]).to eq(nil)
  end
end
