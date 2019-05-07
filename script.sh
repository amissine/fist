# {{{1
# To run locally:
#
# ./script.sh enp2s0 amissine
#
set -e
sudo rm -rf $GOPATH/src/github.com/stellar/go
#echo "TRAVIS_BUILD_DIR=$TRAVIS_BUILD_DIR GOPATH=$GOPATH"

# Determine the IP address of the VM {{{1
VM_IP_ADDRESS=`ifconfig | grep -A 1 $1 | grep 'inet addr:'`
VM_IP_ADDRESS=${VM_IP_ADDRESS:20}
export VM_IP_ADDRESS=${VM_IP_ADDRESS%% *}
echo "VM_IP_ADDRESS $VM_IP_ADDRESS"

# Set up the env {{{1
. common.env
export FI1_DOMAIN_LOCAL_URL="http://localhost:$FI1_LOCAL_PORT"
export FI2_DOMAIN_LOCAL_URL="http://localhost:$FI2_LOCAL_PORT"
export PROXY_TIMEOUT_MS=600000

# Start proxy {{{1
proxy='https-proxy.js'
sudo -E $(which node) $proxy &

# Check/setup Stellar accounts {{{1
node checkAccount.js $FI1_RECEIVING_ACCOUNT
node checkAccount.js $FI2_RECEIVING_ACCOUNT
node checkAccount.js $ISSUING_ACCOUNT
node useIssuer.js $ISSUING_SEED 20 TEST $FI1_RECEIVING_SEED 6
node useIssuer.js $ISSUING_SEED 20 TEST $FI2_RECEIVING_SEED 9

# Check/setup Stellar components - executables bridge and compliance {{{1
./check_components.sh $2

# Run the tests in the docker containers {{{1
if false; then
docker-compose up -d --build
node runTests.js
docker-compose down
fi

# Kill the proxy {{{1
pid=`ps -ef | grep $proxy | grep node | tail -n 1`
echo $pid
pid=${pid:10} && pid=${pid%% *}
echo "Killing pid $pid"
sudo kill $pid
# }}}1
echo "$0 exiting"
