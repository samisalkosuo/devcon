#FROM kazhar/devcon:latest
FROM devcon:latest

RUN devcon-tool ffmpeg-install 
RUN devcon-tool imagemagick-install
