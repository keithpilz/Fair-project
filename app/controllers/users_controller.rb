class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User has subscribed!'
      UserSubscribed.subscription_email(@user.id).deliver
    else
      flash[:error] = 'This email address is already subscribed'
    end
    redirect_to subscribe_path
  end

  def admin_login
    @user = User.new
  end

  def admin_authenticate
    session[:current_user_id] = nil
    @user = User.authenticate(user_params)
    if @user && @user.is_admin
      session[:current_user_id] = @user.id
      redirect_to admin_dashboard_path
    else
      flash[:error] = 'You aint no admin'
      redirect_to admin_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email_address, :password_hash)
  end
end
