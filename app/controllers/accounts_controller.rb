class AccountsController < ApplicationController
  before_action :logged_in_user, except: %i(new create)
  before_action :get_current_user, only: %i(edit update)

  def new
    @account = User.new
  end

  def create
    @account = User.new user_params
    if @account.save
      @account.send_activation_email
      flash[:info] = t "controllers.users.create_success"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @account.authenticate(user_params[:password_old])
      if @account.update_attributes user_params.slice(:password, :password_confirmation)
        flash[:success] = t "controllers.users.update_success"
        redirect_to root_url
      else
        render :edit
      end
    else
      @account.errors.add :old_password, "wrong"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation,
      :password_old
  end

  def get_current_user
    @account = current_user
  end
end
