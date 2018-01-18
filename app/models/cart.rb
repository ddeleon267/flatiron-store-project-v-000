class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    self.items.map{|item| item.price}.reduce(:+)
  end

  def add_item(item)
    Item.find(item).line_items << LineItem.new
  end
end
