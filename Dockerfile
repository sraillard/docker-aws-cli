# The latest Alpine Linux available
FROM docker.io/alpine:3.14.3

# Maintainer label for public images
LABEL maintainer="Sebastien RAILLARD"

# Install aws CLI (v1 as v2 still need glibc...)
# Check version with "aws --version"
RUN apk --no-cache add python3 py3-pip groff && \
    pip3 --no-cache-dir install --upgrade pip && \
    pip3 --no-cache-dir install --upgrade awscli==1.22.73

# Install imaging tools (alternative to Docker - no daemon, easier to install)
# buildah (build), skopeo (transfer) and runc (for RUN command)
RUN apk add --no-cache skopeo runc buildah

# Replace "overlay" by "vfs" storage driver
RUN sed -i 's/driver = "overlay"/driver = "vfs"/' /etc/containers/storage.conf

# Install bash (better than sh to work)
RUN apk add --no-cache bash
# Default bash prompt
COPY .bashrc /root/.bashrc

# Install make tools
RUN apk add --no-cache make

# Create a working directory and use it
RUN mkdir /work
WORKDIR /work
