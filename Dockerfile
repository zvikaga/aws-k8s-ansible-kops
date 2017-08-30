FROM alpine:3.6

CMD ["/bin/sh"]

RUN apk update && \
    apk add --no-cache ca-certificates && \
    apk add --no-cache wget && \
    apk add --no-cache ansible && \
    apk add --no-cache curl && \
    apk add --no-cache py-pip && \
    apk add --no-cache groff && \
    apk add --no-cache vim &&  \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

RUN mkdir /etc/ansible && \
    mkdir ~/.ssh && \
    chmod 755 ~/.ssh && \
    pip install boto boto3


RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.7.2/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl && \
    wget https://github.com/kubernetes/kops/releases/download/1.7.0/kops-linux-amd64 -O /usr/local/bin/kops && \
    chmod u+x /usr/local/bin/kops /usr/local/bin/kubectl
