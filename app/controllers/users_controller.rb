class UsersController < ApplicationController
  
  def show
    @nickname = current_user.nickname
    # user = User.find(params[:id])
    # @nickname = user.nickname
    # @products = User.reviews.notes.page(params[:page]).per(8).order("created_at DESC")
  end
  
end
