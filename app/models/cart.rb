class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    self.items.map{|item| item.price}.reduce(:+)
  end

  def add_item(item_id)
    current_line_item = self.line_items.find_by(item_id: item_id)
     
    if current_line_item
      current_line_item.quantity += 1
      current_line_item
    else
      self.line_items.build(item_id: item_id, quantity: 1)
    end
  end
end
