class ApplicationController < ActionController::Base
  include SessionsHelper

  private
    def not_logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def logged_in_user
      redirect_to root_path if logged_in?
    end
end
