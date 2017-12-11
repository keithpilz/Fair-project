class UsersController < ApplicationController
  def new
    p flash
    @user = User.new
    p User.all
  end

  def create
    if user = User.create(user_params)
      flash[:success] = 'User has subscribed!'
    end
    redirect_to subscribe_path
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end
end
