FROM alpine:3.6

RUN apk update && apk add --no-cache ca-certificates \
    ansible \
    curl \
    py-pip \
    groff \
    vim \
    git && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

RUN pip install boto boto3

RUN mkdir /etc/ansible && \
    mkdir ~/.ssh && \
    chmod 755 ~/.ssh


CMD [ "/bin/sh", "-c", "cd etc/ansible && git clone $GIT_REPO . && /bin/sh"]