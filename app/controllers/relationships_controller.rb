class RelationshipsController < ApplicationController
  def index
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
