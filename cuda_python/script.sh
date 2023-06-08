set -e

while getopts b:p:t: flag
do
    case "${flag}" in
        b) BASE_IMAGE=${OPTARG};;
        p) PYTHON_VERSION=${OPTARG};;
        t) DOCKER_IMAGE_TAG=${OPTARG};;
    esac
done

if [ -z "$BASE_IMAGE" ]
then
    BASE_IMAGE="nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04"
fi

if [ -z "$PYTHON_VERSION" ]
then
    PYTHON_VERSION="3.8.10"
fi

if [ -z "$DOCKER_IMAGE_TAG" ]
then
    echo "Please specify the docker image tag: -t [TAG]"
    exit 1
fi

echo "base image: $BASE_IMAGE"
echo "python version: $PYTHON_VERSION"
echo "docker image tag: $DOCKER_IMAGE_TAG"

docker build -t $DOCKER_IMAGE_TAG --build-arg NVIDIA_CUDA_IMAGE=$BASE_IMAGE --build-arg PYTHON_VERSION=$PYTHON_VERSION .
