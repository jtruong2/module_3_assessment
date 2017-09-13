class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.items_without_date
  end
end
