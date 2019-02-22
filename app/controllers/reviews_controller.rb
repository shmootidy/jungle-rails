class ReviewsController < ApplicationController

  def create

    product = Product.find(params[:product_id])

    @review = Review.new(
      product: product,
      rating: params[:review].values[1].to_i,
      description: params[:review].values[0].to_s,
      user: current_user
      )

    @review.save!
    redirect_to '/'
  end

end
