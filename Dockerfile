# The latest Alpine Linux available
FROM docker.io/alpine:3.11

# Maintainer label for public images
LABEL maintainer="Sebastien RAILLARD"

# Install AWS CLI version 1.x
# Check releases here:
# https://github.com/infrastructure-as-code/docker-aws-cli/releases
ENV AWSCLI_VERSION "1.18.49"
RUN apk --no-cache add python py-pip groff less mailcap && \
    pip --no-cache-dir install --upgrade awscli==${AWSCLI_VERSION} && \
    apk del py-pip

# Install imaging tools (alternative to Docker - no daemon, easier to install)
RUN apk add --no-cache skopeo && \
    apk add --no-cache runc && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ buildah

# Install bash (better than sh to work)
RUN apk add --no-cache bash

# Install make tools
RUN apk add --no-cache make

# Create a working directory and use it
RUN mkdir /work
WORKDIR /work
