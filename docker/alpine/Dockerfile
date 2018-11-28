FROM alpine:3.8

ARG VERSION

RUN mkdir -p /lib64
RUN ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN mkdir -p /entrypoint

RUN wget -O /entrypoint/tini https://github.com/krallin/tini/releases/download/v0.18.0/tini-muslc-amd64
RUN chmod +x /entrypoint/tini

RUN wget -O - https://github.com/localghost/healthy/releases/download/${VERSION}/healthy-${VERSION}.gz | gunzip > /entrypoint/healthy
RUN chmod +x /entrypoint/healthy

EXPOSE 80
ENTRYPOINT ["/entrypoint/tini", "/entrypoint/healthy"]
