# asdf-ubuntu
A Docker sandbox in ubuntu setup with asdf to start adding plug-ins.

To build:
`docker build -t asdf:latest .`

To Run:
`docker run -it -v ${PWD}/src:/home/src --name coding-practice-python asdf bash`

To run Python code just 
Cd into `src` (optional)

Run the scripts:
`$ python test.py`

### Expanding to other plug-ins (languages)
You can use the base image in the Dockerfile to add new plugins. Follow the pattern:

```dockerfile
# Python
FROM base as asdf-python
RUN apt-get -y install build-essential zlib1g-dev libssl-dev
SHELL ["/bin/bash", "--login", "-c"] 
RUN asdf plugin add python
RUN asdf install python 3.10.8
RUN asdf global python 3.10.8
WORKDIR /home
```

By first adding the dependencies, change the shell to use a login session so it loads the `~/.bashrc` file and hence the `asdf` CLI and then add and install the desired plug-in. 

You'll find the list of all availables plugins [here.](https://github.com/asdf-vm/asdf-plugins)

If you want to just get started writting and running python scripts you can download the Docker image ready to run [here](https://hub.docker.com/repository/docker/jgonzalezd/asdf). You just need to pull the image and Run it as described previously.
```
$ docker pull jgonzalezd/asdf
$ docker run -it -v ${PWD}/src:/home/src --name coding-practice-python jgonzalezd/asdf bash
> python src/test.py
```
