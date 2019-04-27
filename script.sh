# Check docker-compose version
docker-compose -v

# Determine the IP address of the VM
VM_IP_ADDRESS=`ifconfig | grep -A 1 $1 | grep 'inet addr:'`
VM_IP_ADDRESS=${VM_IP_ADDRESS:20}
VM_IP_ADDRESS=${VM_IP_ADDRESS%% *}
echo "VM_IP_ADDRESS $VM_IP_ADDRESS"

# Start proxy
sudo -E $(which node) https-proxy.js &
pid=$!

# Sleep, then kill the proxy
sleep 5
sudo kill $pid

echo "$0 exiting"
