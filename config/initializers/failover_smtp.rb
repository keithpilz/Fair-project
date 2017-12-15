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

FailoverSMTP.smtp_settings_array = [second_sendgrid_settings, sendgrid_settings]