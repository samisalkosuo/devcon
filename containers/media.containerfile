FROM docker.io/kazhar/devcon:latest

RUN devcon-tool ffmpeg-install 
RUN devcon-tool imagemagick-install
