Creation of my own docker image for Jupyterlab. I based this on docker-compose and Dockerfile from @silaskalmbach

Notes:

1) In docker-compose.yml the parameter "image:" assigns the name of image. Name it the same as your Docker Hub repository for easier way to push it to hub later.
2) Don´t forget to login to your docker account: docker login
3) Push to Docker Hub with: docker push <hub-user>/<repo-name>:<tag> 

  
To Do:
1) add mysql-connector-java-8.0.28 to /usr/local/lib/python3.8/dist-packages/pyspark/jars/  (for working jdbc connection from pyspark to MariaDB)
