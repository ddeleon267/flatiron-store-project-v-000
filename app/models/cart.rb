class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    self.items.map do |item|
      item_quantity = self.line_items.find_by(item_id: item.id).quantity
      item.price * item_quantity
    end.reduce(:+)
  end

  def add_item(item_id)
    item = self.line_items.find_by(item_id: item_id)

    if item
      item.quantity += 1
      item
    else
      self.line_items.build(item_id: item_id, quantity: 1)
    end
  end
end
