ARG BUILD_FROM
ARG ABS_VERSION=2.32.1

### STAGE 1: Get ABS from official release ###
FROM ghcr.io/advplyr/audiobookshelf:${ABS_VERSION} AS abs-source

### STAGE 2: Build final image ###
FROM ${BUILD_FROM}

# Runtime dependencies
RUN apk add --no-cache \
    nodejs \
    npm \
    tini \
    tzdata

# Copy ABS from official image
COPY --from=abs-source /app /app

WORKDIR /app

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
