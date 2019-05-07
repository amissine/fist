#!/bin/bash
#
# Check/setup Stellar financial services - executables bridge and compliance
#
CLONE_URL="https://github.com/$1/go"
PREFIX=https://github.com/stellar/bridge-server/releases/download/
ARCH=-linux-amd64.tar.gz

function check_services () {
  if [ "$BRIDGE_VERSION" == "master" ]; then
    export MONOREPO=$GOPATH/src/github.com/stellar/go
    if [ -d $MONOREPO ]; then  # TODO: check CLONE_URL (must be the same)
      echo ===== PULLING =====
      cd $MONOREPO
      [ `git pull origin master | grep Already | wc -l` -eq 1 ] && return
    else
      echo ===== CLONING =====
      mkdir -p $MONOREPO
      git clone $CLONE_URL $MONOREPO
      cd $MONOREPO
    fi  
    dep ensure -v
    go build -v ./services/bridge
    go build -v ./services/compliance
    cd -
    # Move binaries to home dir
    mv $MONOREPO/bridge $MONOREPO/compliance .
  else
    wget  -nv $PREFIX$BRIDGE_VERSION/bridge-$BRIDGE_VERSION$ARCH
    wget  -nv $PREFIX$BRIDGE_VERSION/compliance-$BRIDGE_VERSION$ARCH
    tar -xvzf bridge-$BRIDGE_VERSION$ARCH
    tar -xvzf compliance-$BRIDGE_VERSION$ARCH
    # Move binaries to home dir and clean up
    mv bridge-$BRIDGE_VERSION-linux-amd64/bridge ./bridge
    mv compliance-$BRIDGE_VERSION-linux-amd64/compliance ./compliance
    rm -rf *-linux-amd64
    rm *.tar.g*
  fi  
  chmod +x ./bridge ./compliance
}

test -d services || mkdir services
pushd services
check_services
popd
