class ReviewsController < ApplicationController
  
  before_action :authenticate_user!, only: :new
  
  def new
    @review = Review.new
    @review.product.build
  end
  
  def create
    Review.create(review_params)
    redirect_to controller: :products, action: :index
  end
  
  private
  def review_params
    params.require(:review).permit(:rate ,:review, products_attributes: [:url])
  end
  
end
