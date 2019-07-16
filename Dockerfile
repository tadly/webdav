FROM alpine:latest AS builder

ENV PKGVER 2.0.1

RUN mkdir -p /tmp/webdav \
    && cd /tmp/webdav \
    && wget https://github.com/hacdias/webdav/releases/download/v${PKGVER}/linux-386-webdav.tar.gz \
    && tar xfvz linux-386-webdav.tar.gz \
    && chmod +x webdav 


# Build actual container
FROM alpine:latest

RUN mkdir -p /config \
    && mkdir -p /data

VOLUME /config
VOLUME /data

WORKDIR /data

COPY config.yaml /config/config.yaml
COPY --from=builder /tmp/webdav/webdav /usr/bin/webdav

EXPOSE 8801

ENTRYPOINT [ "/usr/bin/webdav" ]
CMD [ "--config", "/config/config.yaml" ]
