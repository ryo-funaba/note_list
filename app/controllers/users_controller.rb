class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @notes = Note.where(id: @user.reviews.select(:note_id)).page(params[:page]).per(7)
    # binding.pry
  end
  
end
