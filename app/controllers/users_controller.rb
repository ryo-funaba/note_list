class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    # @nickname = user.nickname
    # notes = user.reviews.notes.page(params[:page]).per(8).order("created_at DESC")
  end
  
end
