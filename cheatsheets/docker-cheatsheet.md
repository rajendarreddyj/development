#Docker Cheatsheet
A collection of useful Docker commands.
* [Container Management](#Container Management)
* [Image management](#Image management)
* [Status](#Status)
* [File System](#File System)

##Container Management

* `docker create`    Create a new container
* `docker start`     Start one or more stopped containers
* `docker run`       Run a command in a new container
* `docker attach`    Attach to a running container
* `docker rename`    Rename a container
* `docker restart`   Restart a running container
* `docker stop`      Stop a running container
* `docker kill`      Kill a running container
* `docker rm`        Remove one or more containers
* `docker port`      List port mappings or a specific mapping for the CONTAINER

##Image management
* `docker build`     Build an image from a Dockerfile
* `docker commit`    Create a new image from a container's changes
* `docker history`   Show the history of an image
* `docker load`      Load an image from a tar archive or STDIN
* `docker save`      Save an image(s) to a tar archive
* `docker tag`       Tag an image into a repository
* `docker rmi`       Remove one or more images

##Status
* `docker top`       Display the running processes of a container
* `docker events`    Get real time events from the server
* `docker ps`        List containers
* `docker images`    List images
* `docker inspect`   Return low-level information on a container or image
* `docker logs`      Fetch the logs of a container
* `docker stats`     Display a live stream of container(s) resource usage statistics

##File System
* `docker diff`      Inspect changes on a container's filesystem
* `docker cp`        Copy files/folders from a container to a HOSTDIR or to STDOUT

##SSH
* `docker exec`      Run a command in a running container
* `docker export`    Export a container's filesystem as a tar archive
* `docker import`    Import the contents from a tarball to create a filesystem image

##Pause
* `docker pause`     Pause all processes within a container
* `docker unpause`   Unpause all processes within a container
* `docker wait`      Block until a container stops, then print its exit code

##Repository/Docker Hub
* `docker search`    Search the Docker Hub for images
* `docker login`     Register or log in to a Docker registry
* `docker logout`    Log out from a Docker registry
* `docker pull`      Pull an image or a repository from a registry
* `docker push`      Push an image or a repository to a registry

##Meta
* `docker info`      Display system-wide information
* `docker version`   Show the Docker version information
