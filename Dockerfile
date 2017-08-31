FROM alpine:3.6

RUN apk update && apk add --no-cache ca-certificates \
    wget \
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


RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.7.2/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl && \
    wget https://github.com/kubernetes/kops/releases/download/1.7.0/kops-linux-amd64 -O /usr/local/bin/kops && \
    chmod u+x /usr/local/bin/kops /usr/local/bin/kubectl


CMD [ "/bin/sh", "-c", "cd etc/ansible && git clone $GIT_REPO . && /bin/sh"]