class UsersController < RankingsController
  
  def show
    @notes = Note.where(id: current_user.reviews.select(:note_id)).order(created_at: :desc).page(params[:page]).per(7)
  end
end
