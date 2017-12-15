class UserSubscribedMailer < ApplicationMailer
  default from: 'kpilson@gmail.com'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def subscription_email(user_id)
    @user = User.find(user_id)
    mail( :to => @user.email_address,
    :subject => 'Thanks for subscribing!')
  end
end
