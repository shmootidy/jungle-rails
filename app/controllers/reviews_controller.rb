class ReviewsController < ApplicationController

  before_action :require_login

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

  def destroy
    @review = Review.find params[:review_id]
    @review.destroy
    redirect_to [:product], notice: 'Review deleted!'
  end

  protected #not 100% sure I need this here, or if it should be private instead

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to do that."
      redirect_to new_session_url
    end
  end

end
