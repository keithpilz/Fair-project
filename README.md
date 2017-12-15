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

TO DELETE PULLED IMAGE, DELETE CONTAINER HOLDING IMAGE AND THEN LOCAL IMAGE