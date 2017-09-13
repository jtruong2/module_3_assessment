class Api::V1::ItemsController < ActionController::Base
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
    item = Item.create(safe_params)
    render json: Item.item_without_date(item.id)
  end

  private

  def safe_params
    params.permit(:name, :description, :image_url)
  end

end
