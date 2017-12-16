# README

To run rails CLI:
```docker-compose run web rails```

To access container, run:
```docker exec -it fairproject_web_1 /bin/bash```

From there you can enter the rails console, loading your container's environment.

Similar to that is accessing the postfix container:
```docker exec -it fairproject_postfix_1 /bin/bash````

To view an output of your logs, run:
```docker-compose logs -f -t```

SENDGRID:
In smtp settings, set username to 'APIKEY' and password to your API_KEY

Hi Mason!

So the meat of the challenge can be found in lib/failover_smtp.rb and config/initializers/failover_smtp.rb

You will need to add your own sendgrid api keys to your .env file, or add another SMTP server configuration of choice for an email to be sent

I was using two sendgrid API keys (!!) because they were the one email server who would let me play nice with localhost and didnt have many limitations

You will need to create an admin user for yourself in order to create an email in the admin panel.

In the rails console, create a user and change your user.email_address to your email of choice, add a password, and change user.is_admin to true

Now you can access the admin portal by logging in via localhost:3000/admin

The very, very simple subscribe page can be found at localhost:3000/subscribe

Thanks for the challenge! Was a really fun one!

