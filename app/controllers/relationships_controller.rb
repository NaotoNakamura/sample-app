class RelationshipsController < ApplicationController
  def index
    # フォローユーザー一覧
    # @user = 
    # フォロワーユーザー一覧
  end

  def create
    user = User.find(params[:id])
    current_user.follow(user)
    redirect_to root_path
  end

  def destroy
    user = User.find(params[:id])
    current_user.unfollow(user)
    redirect_to root_path
  end

end
