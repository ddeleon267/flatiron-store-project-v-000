class Item < ActiveRecord::Base
  has_many :line_items
  has_many :carts, through: :line_items
  belongs_to :category

  def self.available_items
    Item.all.select do |item|
      item.inventory >= 1
    end
  end
end
