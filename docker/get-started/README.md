Get Started With Docker
=======================
The examples in this directory were written while studying the official
[Get started with Docker][GETSTARTED] documentation.

[GETSTARTED]: https://docs.docker.com/get-started/


Install Docker on macOS
-----------------------
 1. Enter the following command to install Docker.

        brew cask install docker

 2. The `docker` command is not available in `PATH` yet. The Docker
    engine is not running yet. Launch Docker using *Spotlight Search* or
    *Launchpad* to start the engine. As soon as the engine starts,
    symbolic links to the`docker` command and a few other related
    commands are created in `/usr/local/bin`.

 3. In the status menu on top, the Docker whale icon appears. Click on
    it to see the status of the engine.

 4. Once the engine status is "Docker is running", check that Docker is
    functional.

        docker version
        docker run hello-world

    The output of the above `docker run` command looks like this:

        $ docker run hello-world
        Unable to find image 'hello-world:latest' locally
        latest: Pulling from library/hello-world
        ca4f61b1923c: Pull complete 
        Digest: sha256:66ef312bbac49c39a89aa9bcc3cb4f3c9e7de3788c944158df3ee0176d32b751
        Status: Downloaded newer image for hello-world:latest

        Hello from Docker!
        This message shows that your installation appears to be working correctly.
        ...
