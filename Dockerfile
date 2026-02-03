ARG BUILD_FROM
ARG ABS_VERSION=2.32.1

### STAGE 1: Get ABS from official release ###
FROM ghcr.io/advplyr/audiobookshelf:${ABS_VERSION} AS abs-source

### STAGE 2: Build final image ###
FROM ${BUILD_FROM}

# Runtime dependencies
RUN apk add --no-cache \
    curl \
    nodejs \
    npm \
    ffmpeg \
    tini \
    tzdata

# Copy ABS from official image
COPY --from=abs-source /app /app
COPY --from=abs-source /usr/local/lib/nusqlite3 /usr/local/lib/nusqlite3

# Bashio
ARG BASHIO_VERSION="0.16.2"
RUN curl -fsSL "https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz" \
    | tar -xzf - -C /tmp \
    && mv /tmp/bashio-${BASHIO_VERSION}/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && rm -rf /tmp/bashio-${BASHIO_VERSION}

ENV NUSQLITE3_DIR="/usr/local/lib/nusqlite3"
ENV NUSQLITE3_PATH="/usr/local/lib/nusqlite3/libnusqlite3.so"

WORKDIR /app

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
