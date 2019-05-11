#!/bin/bash
# Acknowledgements: {{{1
# - https://derickbailey.com/2017/03/09/selecting-a-node-js-image-for-docker/
#
# To run locally:
#
# ./script.sh enp2s0 amissine
#
set -e
# Determine the IP address of the VM {{{1
s=`ifconfig | grep -A 1 $1 | grep 'inet addr:'`; echo $s
s=${s#*:} # from the beginning of s, drop the shortest part that ends with ':';
          # keep the rest in s
VM_IP_ADDRESS=${s%% *} # from the end of s, drop the longest part that starts with ' ';
                       # keep the rest in VM_IP_ADDRESS
echo "VM_IP_ADDRESS $VM_IP_ADDRESS"
# Set up the env {{{1
export VM_IP_ADDRESS
. common.env
export FI1_DOMAIN_LOCAL_URL="http://localhost:$FI1_LOCAL_PORT"
export FI2_DOMAIN_LOCAL_URL="http://localhost:$FI2_LOCAL_PORT"
export PROXY_TIMEOUT_MS=600000
# Start proxy {{{1
proxy='https-proxy.js'
sudo -E $(which node) $proxy &
# Check/setup Stellar accounts {{{1
if [ "$3" != "skip_Stellar_accounts" ]; then
node checkAccount.js $FI1_RECEIVING_ACCOUNT
node checkAccount.js $FI2_RECEIVING_ACCOUNT
node checkAccount.js $ISSUING_ACCOUNT
node useIssuer.js $ISSUING_SEED 20 TEST $FI1_RECEIVING_SEED 6
node useIssuer.js $ISSUING_SEED 20 TEST $FI2_RECEIVING_SEED 9
fi
# Check/setup Stellar and FI components to test {{{1
./check_components.sh $2
# Run the tests in the docker containers {{{1
docker build ./services -t services
docker-compose --log-level INFO up & 
node runTests.js
docker-compose down
docker image ls
# Kill the proxy {{{1
#s=`ps -ef | grep $proxy | grep node | tail -n 1`; echo $s
#s=${s#* } # from the beginning of s, drop the shortest part that ends with ' ';
#          # keep the rest in s
#echo $s
#echo ${s%% *}
#pid2kill=${s%% *} # from the end of s, drop the longest part that starts with ' ';
#                  # keep the rest in pid2kill
#echo "length of pid2kill: ${#pid2kill}"
#echo "Killing pid $pid2kill"
#sudo -E kill $pid2kill
