FROM alpine:3.13.6

ARG KUBE_VERSION="v1.21.5"

ADD https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl /bin/kubectl

RUN apk --update add curl ca-certificates && \
    chmod +x /bin/kubectl && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

ENTRYPOINT ["kubectl"]
CMD ["--help"]
