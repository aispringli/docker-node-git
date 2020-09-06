FROM ubuntu:20.04

LABEL MAINTAINER Spring Lee "3377939225@qq.com"

# update curl
RUN apt-get update && \
    apt-get install -y curl gettext

# Docker 19.03.9
ENV DOCKER_VERSION docker-19.03.9
RUN curl -L -o /tmp/docker.tgz https://download.docker.com/linux/static/stable/x86_64/${DOCKER_VERSION}.tgz && \
    tar -xz -C /tmp -f /tmp/docker.tgz && \
    mv /tmp/docker/* /usr/bin && \
    rm -rf /tmp/*

# Node Version 14
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    npm install yarn -g    

# git
RUN apt-get install -y git

# clean
RUN apt-get purge -y --auto-remove \
    gettext \
    curl && \
    apt-get clean