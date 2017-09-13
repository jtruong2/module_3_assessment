class Api::V1::ItemsController < ApplicationController
  def index
    item = Item.all
    render json: Item.all
  end
end
