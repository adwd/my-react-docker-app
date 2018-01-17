#!/usr/bin/env bash
set -eo pipefail

case $1 in
  start)
    docker run -it -p 3000:3000 -v $(pwd):/app react:app
    ;;
  test)
    docker run -it -p 3000:3000 -v $(pwd):/app react:app test ${@:2}
    ;;
  build)
    docker container run -it -v $(pwd):/app react:app build
    ;;
  update)
    docker build -t react:app .
    ;;
  *)
    docker run -it -p 3000:3000 -v $(pwd):/app react:app
    ;;
esac
