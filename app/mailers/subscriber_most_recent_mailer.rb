class SubscriberMostRecentMailer < ApplicationMailer
  default from: 'kpilson@gmail.com'

  def self.send_subscriber_emails(user_ids)
    @email = Email.latest_published_email
    user_ids.each do |id|
      @user = User.find(id)
      subscriber_email(@user.email_address, @email.subject).deliver
      @user.emails << @email
    end
  end


  def subscriber_email(address, subject)
    mail( :to => address,
    :subject => subject)
  end
end
