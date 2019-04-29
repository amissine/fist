#
# To run locally:
#
# ./script.sh enp2s0
#
set -e

# Check docker-compose version
docker-compose -v

# Determine the IP address of the VM
VM_IP_ADDRESS=`ifconfig | grep -A 1 $1 | grep 'inet addr:'`
VM_IP_ADDRESS=${VM_IP_ADDRESS:20}
export VM_IP_ADDRESS=${VM_IP_ADDRESS%% *}
echo "VM_IP_ADDRESS $VM_IP_ADDRESS"

# Set up the env
. common.env
export FI1_DOMAIN_LOCAL_URL="http://localhost:$FI1_LOCAL_PORT"
export FI2_DOMAIN_LOCAL_URL="http://localhost:$FI2_LOCAL_PORT"
export PROXY_TIMEOUT_MS=600000

# Start proxy
proxy='https-proxy.js'
sudo -E $(which node) $proxy &

# Check/setup Stellar accounts
node checkAccount.js $FI1_RECEIVING_ACCOUNT
node checkAccount.js $FI2_RECEIVING_ACCOUNT
node checkAccount.js $ISSUING_ACCOUNT
node useIssuer.js $ISSUING_SEED 20 TEST $FI1_RECEIVING_SEED 6
node useIssuer.js $ISSUING_SEED 20 TEST $FI2_RECEIVING_SEED 9

# Kill the proxy
pid=`ps -ef | grep $proxy | grep node | tail -n 1`
echo $pid
pid=${pid:10} && pid=${pid%% *}
echo "Killing pid $pid"
sudo kill $pid

echo "$0 exiting"
