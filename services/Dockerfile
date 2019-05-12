FROM  ubuntu:16.04
RUN apt-get update; apt-get -y install postgresql-client wget
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash && \. /root/.nvm/nvm.sh && nvm install 6.17

ADD . /services
WORKDIR /services
CMD ./start.sh
