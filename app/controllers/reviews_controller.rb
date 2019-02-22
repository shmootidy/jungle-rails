class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    raise "yay!"
  end

end
