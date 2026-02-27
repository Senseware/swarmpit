#!/usr/bin/env bash

set -euo pipefail

docker rm -f dind >/dev/null 2>&1 || true
docker run --privileged --name dind -p 12375:2375 -e DOCKER_TLS_CERTDIR='' -d docker:$DOCKER-dind
export DOCKER_API_VERSION=1.52

for _ in $(seq 1 60); do
  if docker -H tcp://localhost:12375 version >/dev/null 2>&1; then
    break
  fi
  sleep 1
done

if ! docker -H tcp://localhost:12375 version >/dev/null 2>&1; then
  echo "dind did not become ready in time"
  docker logs dind || true
  exit 1
fi

docker -H tcp://localhost:12375 version
docker -H tcp://localhost:12375 swarm init
docker -H tcp://localhost:12375 load -i $(dirname "${BASH_SOURCE[0]}")/hello-world.tar
