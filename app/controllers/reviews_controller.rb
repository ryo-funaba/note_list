class ReviewsController < ApplicationController
  
  before_action :authenticate_user!, only: :new
  attor_accessor :url
  def new
    @review = Review.new
    @review.note.build
  end
  
  def create
    Review.create(review_params)
    redirect_to controller: :notes, action: :index
  end
  
  private
  def review_params
    params.require(:review).permit(:rate ,:review, notes_attributes: [:url])
  end
  
end
