Creation of my own docker image for Jupyterlab

Notes:

1) In docker-compose.yml the parameter "image:" assigns the name of image. Name it the same as your Docker Hub repository for easier way to push it to hub later.
2) Don´t forget to login to your docker account: docker login
3) Push to Docker Hub with: docker push <hub-user>/<repo-name>:<tag> 
