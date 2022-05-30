class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      # params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      # remember user
      redirect_to user
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが違います'
      render 'new'
    end
  end
end
