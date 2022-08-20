class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def not_logged_in_user
    return if logged_in?

    flash[:danger] = t 'auth.please_login'
    redirect_to login_url
  end

  def logged_in_user
    redirect_to root_path if logged_in?
  end
end
