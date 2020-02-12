class ReviewsController < ApplicationController
  
  before_action :authenticate_user!, only: :new
  
  def new
    @product = Product.new
    @product.reviews.build
  end
  
  def create
    Product.create(product_params)
    redirect_to controller: :products, action: :index
  end
  
  private
  def product_params
    params.require(:product).permit(:url, reviews_attributes: [:rate ,:review])
  end
  
end
