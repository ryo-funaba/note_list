class ReviewsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]
  
  
  def new
    @review = Review.new
  end
  
  def create
    Review.create(review_params)
    redirect_to controller: :notes, action: :index
  end
  
  private
  def review_params
    params.require(:review).permit(:rate ,:review, :url).merge(user_id: current_user.id)
  end
  
end
