class ReviewsController < ApplicationController
  
  before_action :authenticate_user!, only: :new
  
  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end
  
end
