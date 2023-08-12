FROM i386/ubuntu:20.04

LABEL org.opencontainers.image.source https://github.com/douglasparker/byond

ARG BYOND_MAJOR
ARG BYOND_MINOR

RUN apt-get update && \
    apt-get install -y curl unzip make libstdc++6 && \
    curl "http://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip" -o byond.zip && \
    unzip byond.zip && \
    cd byond && \
    sed -i 's|install:|&\n\tmkdir -p $(MAN_DIR)/man6|' Makefile && \
    make install && \
    apt-get purge -y --auto-remove curl unzip make && \
    cd .. && \
    rm -rf byond byond.zip /var/lib/apt/lists/*

RUN         apt update && apt upgrade -y \
				&& apt install -y gcc g++ libgcc1 libc++-dev gdb libc6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 cabextract iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 \
    			libfontconfig libicu63 icu-devtools libunwind8 libssl-dev sqlite3 libsqlite3-dev libmariadbclient-dev libduktape203 locales ffmpeg gnupg2 apt-transport-https software-properties-common ca-certificates tzdata \
    			liblua5.3 libz-dev rapidjson-dev \
				&& update-locale lang=en_US.UTF-8 \
				&& dpkg-reconfigure --frontend noninteractive locales \
				&& useradd -m -d /home/container -s /bin/bash container

USER        container
ENV         USER=container HOME=/home/container
ENV         DEBIAN_FRONTEND noninteractive

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
