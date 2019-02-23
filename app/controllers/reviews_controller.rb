class ReviewsController < ApplicationController

  # before_action :authenticate

  def create
    product = Product.find(params[:product_id])

    @review = Review.new(
      product: product,
      rating: params[:review].values[1].to_i,
      description: params[:review].values[0].to_s,
      user: current_user
      )

    @review.save

    unless @review.save
      # render(?) error message here
    end
    redirect_to product
  end


end
