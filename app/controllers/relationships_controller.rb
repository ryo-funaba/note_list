class RelationshipsController < ApplicationController
  # before_action :set_user

  def create
    # following = current_user.follow(@user)
    # if following.save
    #   flash[:success] = 'ユーザーをフォローしました'
    #   redirect_to @user
    # else
    #   flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    #   redirect_to @user
    @user = User.find(params[:following_id])
    current_user.follow(@user)
  end

  def destroy
    # following = current_user.unfollow(@user)
    # if following.destroy
    #   flash[:success] = 'ユーザーのフォローを解除しました'
    #   redirect_to @user
    # else
    #   flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
    #   redirect_to @user
    # end
    @user = User.find(params[:id])
    current_user.unfollow(@user)
  end

  private

end