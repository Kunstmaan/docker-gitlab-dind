FROM gitlab/dind

RUN apt-get update && \
    apt-get upgrade -q -y && \
    apt-get dist-upgrade -q -y && \
    apt-get -q -y install python-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install docker-cloud && \
    docker-cloud -v