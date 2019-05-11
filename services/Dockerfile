FROM  ubuntu:16.04
RUN apt-get update; apt-get -y install postgresql-client wget
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash && \. /root/.nvm/nvm.sh && nvm install 6.17
#FROM  node:6.17.1-alpine
#RUN set -ex; apk update; apk add --no-cache postgresql-client

# This fixes the './bridge: not found' issue
#RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
# Acknowledgements:
# https://stackoverflow.com/questions/34729748/installed-go-binary-not-found-in-path-on-alpine-linux-docker

ADD . /services
WORKDIR /services
CMD ./start.sh
