class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.items_without_date
  end

  def show
    render json: Item.item_without_date(params[:id])
  end

  def destroy
    Item.destroy(params[:id])
    render json: Item.items_without_date
  end

  def create
  end
end
