sudo rm /usr/local/bin/docker-compose
url_prefix=https://github.com/docker/compose/releases/download
url_suffix=/$1/docker-compose-`uname -s`-`uname -m`
url="$url_prefix$url_suffix"
curl -L $url > docker-compose
chmod +x docker-compose
sudo mv docker-compose /usr/local/bin
