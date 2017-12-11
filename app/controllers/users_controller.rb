class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User has subscribed!'
    else
      flash[:error] = 'This email address is already subscribed'
    end
    redirect_to subscribe_path
  end

  private
  def user_params
    params.require(:user).permit(:user_email_address)
  end
end
