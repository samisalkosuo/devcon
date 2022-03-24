echo "Build all containers..."

set -e 

#show build progress. Values: "auto", "plain", "tty"
export BUILDKIT_PROGRESS=plain

DOCKERFILE_DIR=dockerfiles
IMAGE_TAG_PREFIX=kazhar/devcon

function buildImage
{
  local tag=$1
  local file=$2

  docker build -t $IMAGE_TAG_PREFIX:$tag -f $DOCKERFILE_DIR/$file .

}

#build images in order
buildImage base 000-base.dockerfile

buildImage python 001-python.dockerfile

buildImage ruby 002-ruby.dockerfile

buildImage nodejs 003-nodejs.dockerfile



#build tools and clients images before the main image
#so that clients are always downloaded just before building the main image
buildImage tools 998-tools.dockerfile
buildImage clients 999-clients.dockerfile

buildImage misc 999-misc.dockerfile

#do not use cache when building the latest image
buildImage "latest --no-cache" Dockerfile
