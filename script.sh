echo "VM_IP_ADDRESS $VM_IP_ADDRESS"
sudo -E $(which node) https-proxy.js &
pid=$!
sleep 5
sudo kill $pid
