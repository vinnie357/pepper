.PHONY: oss plus boss bplus

export CONTAINER_IMAGE=pepper
export UPSTREAM_SERVER=example.com

default: boss oss

p: bplus plus

boss:
		docker build --pull --rm -f "Dockerfile.oss" -t ${CONTAINER_IMAGE}-oss:latest .

bplus:
		
		docker build --pull --rm -f "Dockerfile.plus" -t ${CONTAINER_IMAGE}:latest .

oss:
		docker run --rm -it -p 80:80/tcp -p 443:443/tcp --env UPSTREAM_SERVER=${UPSTREAM_SERVER} --env PLATFORM=oss ${CONTAINER_IMAGE}-oss:latest

plus:
		docker run --rm -it -p 80:80/tcp -p 443:443/tcp --env UPSTREAM_SERVER=${UPSTREAM_SERVER} --env PLATFORM=plus ${CONTAINER_IMAGE}:latest