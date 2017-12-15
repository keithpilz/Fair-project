class UserSubscribedMailer < ApplicationMailer
  default from: 'kpilson@gmail.com'

  def subscription_email(user_id)
    @user = User.find(user_id)
    mail( :to => @user.email_address,
    :subject => 'Thanks for subscribing!')
  end
end
