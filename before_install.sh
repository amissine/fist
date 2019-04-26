# Display the VM info
uname -a

# Display the docker version
#docker -v

# Display the NodeJS version
#node -v

# Determine the IP address of the VM
VM_IP_ADDRESS=`ifconfig | grep -A 1 $1 | grep 'inet addr:'`
VM_IP_ADDRESS=${VM_IP_ADDRESS:20}
VM_IP_ADDRESS=${VM_IP_ADDRESS%% *}
echo $VM_IP_ADDRESS
