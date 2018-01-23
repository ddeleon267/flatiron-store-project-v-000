class LineItemsController < ApplicationController

  def create
    if !current_user.current_cart
      current_user.current_cart = current_user.carts.create
    end

    @current_cart = current_user.current_cart
    line_item = @current_cart.add_item(params[:item_id])
    line_item.save
    redirect_to cart_path(@current_cart)
  end
end
