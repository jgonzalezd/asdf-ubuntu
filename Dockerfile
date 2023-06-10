FROM ubuntu:bionic-20220913 as base

RUN apt-get update && \
    apt-get -y install curl git

RUN git clone https://github.com/asdf-vm/asdf.git /home/.asdf --branch v0.10.2
RUN chmod 645 /home/.asdf/asdf.sh 
RUN echo '. /home/.asdf/asdf.sh' > ~/.bashrc


# Python
FROM base as asdf-python
RUN apt-get -y install build-essential zlib1g-dev libssl-dev
SHELL ["/bin/bash", "--login", "-c"] 
RUN asdf plugin add python
RUN asdf install python 3.10.11
RUN asdf global python 3.10.11

WORKDIR /home

