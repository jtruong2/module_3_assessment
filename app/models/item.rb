class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items

  def self.items_without_date
    items = Item.all
    items.map do |item|
      item.attributes.reject { |}
  end
end
