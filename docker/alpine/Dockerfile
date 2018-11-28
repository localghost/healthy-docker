FROM alpine:3.8

ARG BUILD_TAG

RUN mkdir -p /lib64
RUN ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN mkdir -p /entrypoint
RUN wget -O /entrypoint/healthy.gz https://github.com/localghost/healthy/releases/download/${BUILD_TAG}/healthy-${BUILD_TAG}.gz
RUN gunzip /entrypoint/healthy.gz
RUN chmod +x /entrypoint/healthy

EXPOSE 80
ENTRYPOINT ["/entrypoint/healthy"]
