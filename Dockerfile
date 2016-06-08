FROM gitlab/dind

RUN apt-get update && \
    apt-get upgrade -q -y && \
    apt-get dist-upgrade -q -y && \
    apt-get -q -y install wget python-yaml python-pip libffi-dev libssl-dev && \
    pip install requests[security] && \
    pip install slacker && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install docker-cloud && \
    docker-cloud -v && \
    cd /tmp && \
    wget https://github.com/rancher/rancher-compose/releases/download/v0.7.4/rancher-compose-linux-amd64-v0.7.4.tar.gz && \
    tar -xvzf rancher-compose-linux-amd64-v0.7.4.tar.gz && \
    cd rancher-compose-v0.7.4 && \
    mv rancher-* /usr/local/bin && \
    cd /tmp && \
    rm -Rf rancher-compose-v0.7.4 && \
    rancher-compose --version

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
    apt-get install -y nodejs

ADD ./slack.py /root/slack.py
