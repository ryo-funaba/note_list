class ReviewsController < RankingsController
  
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_review, only: [:edit, :update, :destroy]
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to controller: :notes, action: :index
    else
      render :new
    end
  end
  
  def edit
    @note = @review.note
  end
  
  def update
    if @review.update(review_params)
      redirect_to note_path(@review.note)
    else
      render :edit
    end
  end
  
  def destroy
    if @review.destroy
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private

  def review_params
    params.require(:review).permit(:rate ,:review, :url).merge(user_id: current_user.id)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end