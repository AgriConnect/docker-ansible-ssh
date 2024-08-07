FROM alpine:3.20

LABEL maintainer="Nguyễn Hồng Quân <ng.hong.quan@gmail.com>"


ENV LANG=en_US.UTF-8
RUN apk --update add bash python3 py3-pip rsync fd sshpass openssh-client ca-certificates && \
    pip3 install -U pip wheel --break-system-packages && \
    pip3 install ansible --break-system-packages --extra-index-url https://pypi.agriconnect.vn/musl/simple/ && \
    ln -s /usr/bin/python3 /usr/local/bin/python && \
    mkdir -p /etc/ansible && echo 'localhost' > /etc/ansible/hosts && \
    rm -rf /var/cache/apk/* && rm -rf /root/.cache/pip && \
    sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd
