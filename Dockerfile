FROM alpine:3.6

RUN apk update && \
    apk add --no-cache ca-certificates && \
    apk add --no-cache ansible && \
    apk add --no-cache curl && \
    apk add --no-cache py-pip && \
    apk add --no-cache groff && \
    apk add --no-cache vim &&  \
    apk add --no-cache git &&  \
    pip install boto boto3 && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

RUN mkdir /etc/ansible && \
    mkdir ~/.ssh && \
    chmod 755 ~/.ssh


ENTRYPOINT  ["/bin/sh", "-c", "cd etc/ansible && git clone $GIT_REPO ."]


CMD ["/bin/sh"]