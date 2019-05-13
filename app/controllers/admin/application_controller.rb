module Admin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper

    #before_action :logged_in_user
    #before_action :admin_user

    private
    def logged_in_user
      return if logged_in?
      store_location
      flash[:danger] = t "controllers.users.login_check"
      redirect_to login_url
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end
  end
end
