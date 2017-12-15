class EmailsController < ApplicationController
  before_action :require_admin_rights

  def index
    @email = Email.new
    @emails = Email.all
    if flash[:error]
      @errors = flash[:error]
    elsif flash[:success]
      @success = flash[:success]
    end
  end

  def create
    email = Email.new(email_params)
    if email.save
      flash[:success] = 'Email successfully created!'
    else
      flash[:error] = email.errors.full_messages
    end
    redirect_to admin_dashboard_path
  end

  private
  def email_params
    params.require(:email).permit(:body, :subject)
  end

  def require_admin_rights
    redirect_to admin_path unless current_user && current_user.is_admin
  end
end