# Display the VM and docker info
#uname -a
#docker info
netstat -anop

# Determine the IP address of the VM
VM_IP_ADDRESS=`ifconfig | grep -A 1 $1 | grep 'inet addr:'`
VM_IP_ADDRESS=${VM_IP_ADDRESS:20}
VM_IP_ADDRESS=${VM_IP_ADDRESS%% *}
echo $VM_IP_ADDRESS
