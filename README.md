Description
===========

Image based on Alpine Linux with the following tools:
* aws-cli version 1 (easier to install than version 2)
* skopeo/runc/buildah as Docker tools aternative (easier to install and no daemon running)
* make tools
* bash shell

Using the prebuilt image
========================

The public Docker Hub repository is here:
https://hub.docker.com/r/sraillard/aws-cli

To run it in interactive mode:
```
docker run --privileged --rm -it -e "AWS_DEFAULT_REGION=xxx" -e "AWS_ACCESS_KEY_ID=xxxx" -e "AWS_SECRET_ACCESS_KEY=xxxx" sraillard/aws-cli:1.18.49-alpine
```

`--privileged` is needed for building docker images.

Building
========

```
docker build -t sraillard/aws-cli:1.18.49-alpine .
```
