class EmailsController < ApplicationController
  before_action :require_admin_rights

  def index
    @email = Email.new
    @emails = Email.all
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

  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])
    if @email.update_attributes(email_params)
      flash[:success] = 'Email successfully edited!'
      redirect_to admin_dashboard_path
    else
      flash[:error] = @email.errors.full_messages
      redirect_back(fallback_location: edit_email_path)
    end
  end

  def destroy
    email = Email.find(params[:id])
    email.destroy
    redirect_back(fallback_location: admin_dashboard_path)
  end

  def publish
    email = Email.find(params[:id])
    email.update_attribute(:is_published, true)
    redirect_back(fallback_location: admin_dashboard_path)
  end

  def send_mail
    user_ids = User.subscribed_users
    SubscriberMostRecentMailer.send_subscriber_emails(user_ids)
  end

  private
  def email_params
    params.require(:email).permit(:body, :subject)
  end

  def require_admin_rights
    redirect_to admin_path unless current_user && current_user.is_admin
  end
end