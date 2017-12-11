# README

To run rails CLI:
```docker-compose run web rails```

To access container, run:
```docker exec -it fairproject_web_1 /bin/bash```

From there you can enter the rails console, loading your container's environment.

To view an output of your logs, run:
```docker-compose logs -f -t```


