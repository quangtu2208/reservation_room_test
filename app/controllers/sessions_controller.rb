class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        redirect_back_or root_url
      else
        flash[:warning] = t "controllers.sessions.active_fail"
        redirect_to root_url
      end
    else
      flash[:danger] = t "controllers.sessions.login_error"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
