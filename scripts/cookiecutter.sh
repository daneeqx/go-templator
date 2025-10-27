#!/bin/sh
set -e

IMAGE_NAME="go-template-cookiecutter"

if ! docker image inspect "$IMAGE_NAME" >/dev/null 2>&1; then
  echo "🔧 Building Docker image $IMAGE_NAME..."
  docker build -t "$IMAGE_NAME" -f Dockerfile .
fi

docker run --rm -i \
  -v "$(pwd):$(pwd)" \
  -v "$(dirname "$(pwd)")":"$(dirname "$(pwd)")" \
  -u "$(id -u):$(id -g)" \
  -e HOME=$(pwd) \
  -w $(pwd) \
  "$IMAGE_NAME" "$@"