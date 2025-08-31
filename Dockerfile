ARG BUILD_FROM=ghcr.io/home-assistant/raspberrypi4-64-base:3.15
FROM ${BUILD_FROM}

RUN apk add --no-cache curl bash libc6-compat

RUN curl -L https://binaries.twingate.com/connector/linux/arm64/latest/twingate-connector \
    -o /usr/local/bin/twingate-connector && \
    chmod +x /usr/local/bin/twingate-connector

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
