class ReviewsController < RankingsController
  
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path, notice: "投稿しました"
    else
      render "new"
    end
  end
  
  def edit
    @review = Review.find(params[:id])
    @note = Note.where(id: @review.note_id)
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to note_path(@review.note), notice: "修正しました"
    else
      render 'edit'
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to root_path, notice: "削除しました"
    else
      render 'edit'
    end
  end
  
  private
  def review_params
    params.require(:review).permit(:rate ,:review, :url).merge(user_id: current_user.id)
  end
  
end