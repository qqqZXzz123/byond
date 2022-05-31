FROM i386/ubuntu:20.04

LABEL org.opencontainers.image.source https://github.com/douglasparker/byond

ARG BYOND_MAJOR
ARG BYOND_MINOR

RUN apt-get update && \
    apt-get install -y curl unzip make libc6 libstdc++6 && \
    curl "http://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip" -o byond.zip && \
    unzip byond.zip && \
    cd byond && \
    make install && \
    apt-get purge -y --auto-remove curl unzip make && \
    cd .. && \
    rm -rf byond byond.zip /var/lib/apt/lists/*