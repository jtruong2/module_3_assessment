class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items

  def self.items_without_date
    Item.all.select(:id, :name, :description, :image_url)
  end

  def self.item_without_date(id)
    Item.select(:id, :name, :description, :image_url).where("id = ?", id).first
  end
end
