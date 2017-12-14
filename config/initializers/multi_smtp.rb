sendgrid_settings = {
  :user_name => 'apikey',
  :password => ENV['SENDGRID_API_KEY'],
  :domain => 'localhost:3000',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

second_sendgrid_settings = {
  :user_name => 'apikey',
  :password => ENV['SECOND_SENDGRID_API_KEY'],
  :domain => 'localhost:3000',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

# mailgun_settings = {
#   :api            => ENV['MAILGUN_API_KEY'],
#   :port           => 587,
#   :address        => 'smtp.mailgun.org',
#   :user_name      => 'postmaster@sandbox6e7861233f27404c995e6a246672b81d.mailgun.org',
#   :password       => 'ef3121caf5c4e500a83a9c5bbc23daf8',
#   :domain         => 'sandbox6e7861233f27404c995e6a246672b81d.mailgun.org',
#   :authentication => :plain
# }

# sparkpost_settings = {
#     :host           => 'smtp.sparkpostmail.com',
#     :port           =>  587,
#     :authentication => 'AUTH LOGIN',
#     :encryption     => 'STARTTLS',
#     :user_name      => 'SMTP_Injection',
#     :password       => ENV['SPARKPOST_API_KEY']
# }

MultiSMTP.smtp_providers = [second_sendgrid_settings, sendgrid_settings]