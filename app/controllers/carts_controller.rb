class CartsController < ApplicationController


  def show
    @current_cart = Cart.find(params[:id])
  end

  def checkout
    @current_cart = Cart.find(params[:id])

    @current_cart.line_items.each do |line_item|
      line_item.item.remove(line_item.quantity)
    end

    @current_cart.update(status: "Submitted")
    current_user.update(current_cart: nil)
    
    redirect_to cart_path(@current_cart)
  end
end
