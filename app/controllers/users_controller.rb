class UsersController < RankingsController

  before_action :set_user, only: [:show]

  def show
    @notes = Note.where(id: @user.reviews.select(:note_id)).order("created_at DESC").page(params[:page]).per(7)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
