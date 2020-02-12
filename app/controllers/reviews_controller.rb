class ReviewsController < ApplicationController
  
  before_action :authenticate_user!, only: :new
  
  def new
    @review = Review.new
  end
  
  def create
    Review.create(create_params)
    redirect_to controller: :products, action: :index
  end
  
  private
  def create_params
    params.require(:review).permit(:review, :rate).merge(product_id: params[:product_id], user_id: current_user.id)
  end
  
end
