require 'io/console'

namespace :config do
  task :setup_admin_user => :environment do
    puts ''
    puts 'Hello Mason and the software team at Fair!'
    puts 'This rake task will create an admin user for you so you dont have to go into the rails console'
    puts ''

    valid_admin = false
    until valid_admin == true

      # set admin email
      valid_email = false
      until valid_email == true
        puts 'whats your email address?'
        email = STDIN.gets.chomp
        puts 'Enter one more time to confirm'
        verify_email = STDIN.gets.chomp
        if email == verify_email
          valid_email = true
        else
          puts 'emails don\'t match'
        end
      end

    # set admin password
    pw = set_password

    u = User.new(email_address: email, is_admin: true)
    u.password = pw

    # save user, error handling if user exists
    begin
      u.save!
      valid_admin = true
      puts 'You are now an admin user! Go to the admin dashboard at /admin, log in, and you will be able to create, delete, edit, and publish emails. you will also be able to send the last published email to all subscribers via a button'
      break
    rescue => e
      if e.message =~ /Validation failed: Email address has already been taken/
        puts ''
        puts ''
        puts 'Looks like youve already signed up.'
        puts 'I\'m assuming that you arent trying to log in as someone else since this isnt in production, and nothing is actually at stake here'
        puts 'Would you like to change your password? (y/n)'
        answer = STDIN.gets.chomp.downcase
        existing_user = User.find_by(email_address: email)
        if answer == 'y'
          pw = set_password
          existing_user.password = pw
        end
        existing_user.is_admin = true
        existing_user.save!
        puts 'Made this user an admin! Now log in at /admin to create and send subscription emails to subscribers!'
        valid_admin = true
        break
      else
        raise e
      end
    end
    end
  end
end

def set_password
  valid_pw = false
  until valid_pw == true
    puts 'enter a password'
    # noecho is to hide terminal input
    pw = STDIN.noecho(&:gets).chomp
    puts 'enter password again to verify'
    verify_pw = STDIN.noecho(&:gets).chomp
    if pw == verify_pw
      valid_pw = true
      puts 'emails match!'
      return pw
    else
      puts 'passwords don\'t match'
    end
  end
end