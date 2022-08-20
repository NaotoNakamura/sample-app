class UsersController < ApplicationController
  before_action :not_logged_in_user, only: [:show, :edit]
  before_action :logged_in_user, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = t 'flash.profile_updated'
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end

  def update
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
    if @user.update(user_params)
      flash[:success] = t 'users.profile.success'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :gender, :password, :password_confirmation)
  end
end
