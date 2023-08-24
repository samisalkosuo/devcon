FROM docker.io/kazhar/devcon:latest

RUN devcon-tool java-install
RUN devcon-tool maven-install
