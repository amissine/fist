# To re-init: {{{1
rm -rf $GOPATH/bin $GOPATH/src

# Check $GOPATH/bin/dep executable. {{{1
[ -x $GOPATH/bin/dep ] || \
  curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

# Check docker-compose version. {{{1
v=`docker-compose -v`
v=${v:23}
v=${v%%,*}
[ "$v" = "$1" ] && exit

# Install another version of docker-compose. {{{1
sudo rm /usr/local/bin/docker-compose
url_prefix=https://github.com/docker/compose/releases/download
url_suffix=/$1/docker-compose-`uname -s`-`uname -m`
url="$url_prefix$url_suffix"
curl -L $url > docker-compose
chmod +x docker-compose
sudo mv docker-compose /usr/local/bin
echo 'Installed docker-compose'
