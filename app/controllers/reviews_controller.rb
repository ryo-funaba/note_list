class ReviewsController < RankingsController
  
  before_action :authenticate_user!, only: [:new, :create]
  
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to controller: :notes, action: :index
    else
      Rails::logger::debug('---------------')
      Rails::logger::debug(@review.errors.messages)
      render "new"
    end
  end
  
  def edit
    @review = Review.find(params[:id])
  end
  
  private
  def review_params
    params.require(:review).permit(:rate ,:review, :url).merge(user_id: current_user.id)
  end
  
end
