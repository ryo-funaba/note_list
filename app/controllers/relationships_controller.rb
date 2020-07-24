class RelationshipsController < ApplicationController
  # before_action :set_user

  def create
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