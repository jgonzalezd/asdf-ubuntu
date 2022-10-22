# asdf-ubuntu
A Docker sandbox in ubuntu setup with asdf to start adding plug-ins.

To build:
`docker build -t asdf:latest .`

To Run:
`docker run -it -v ${PWD}/src:/home/src --name coding-practice-python asdf bash`
