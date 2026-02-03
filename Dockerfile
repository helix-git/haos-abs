# Audiobookshelf version - update this for ABS upgrades
ARG ABS_VERSION=2.32.1
FROM ghcr.io/advplyr/audiobookshelf:${ABS_VERSION}

# Install bashio for Home Assistant integration
RUN apk add --no-cache \
    bash \
    curl \
    jq

# Install bashio
ARG BASHIO_VERSION="0.16.2"
RUN curl -fsSL "https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz" \
    | tar -xzf - -C /tmp \
    && mv /tmp/bashio-${BASHIO_VERSION}/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && rm -rf /tmp/bashio-${BASHIO_VERSION}

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
