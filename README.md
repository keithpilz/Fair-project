# README

## Hi Mason!

#### So the meat of the challenge can be found in ```lib/failover_smtp.rb``` and ```config/initializers/failover_smtp.rb```

### You will need to add your own sendgrid api keys to your .env file, or add another SMTP server configuration of choice for an email to be sent

You will need to create an admin user for yourself in order to create an email in the admin panel.

### Or you can run ```docker-compose run web rake config:setup_admin_user```
#### This is a rake task that I wrote to automate admin user creation (so you don't have to enter the rails console). It will greet you and take you through the steps to creating a user and then tell you your next steps.

*But if you'd like to go into the rails console:*

In the rails console, create a user and change your user.email_address to your email of choice, add a password, and change user.is_admin to true

### Now you can access the admin portal by logging in via ```localhost:3000/admin```

##### In the admin portal, you can create, edit, and delete emails. You can also 'publish' emails and send these published emails.

#### The very, very simple subscribe page can be found at ```localhost:3000/subscribe```

#### I wrote two actionmailer methods. When a user subscribes, they should receive a welcome email. The other mailer, found in ``` /mailers/subscriber_most_recent_mailer.rb```, and sent from a button in the admin panel, sends the most recent email to every subscribed user

Thanks for the challenge! Was a really fun one!

_Keith_

_________________

To run rails CLI:
```docker-compose run web rails```

To access container, run:
```docker exec -it fairproject_web_1 /bin/bash```

From there you can enter the rails console, loading your container's environment.

To view an output of your logs, run:
```docker-compose logs -f -t```

SENDGRID:
In smtp settings, set username to 'APIKEY' and password to your API_KEY