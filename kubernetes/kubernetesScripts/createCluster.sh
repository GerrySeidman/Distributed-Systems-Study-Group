# set -x
echo "About to Create cluster"
read -s -p "password: "  SSHP
echo "  "

KUBE_MASTER="kube-master" #This will be your control-plane make sure it matches your master node
KUBE_NODES="kube-1,kube-2,kube-3"
NODE=$(hostname)
# SCRIPT_LOCATION=${SCRIPT_LOCATION:-"false"}
COPY_KUBE_FILES=${COPY_KUBE_FILES:-"true"}

sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

if [[ $NODE -eq $KUBE_MASTER ]]
then
    sudo kubeadm init --apiserver-advertise-address=172.16.16.78 --pod-network-cidr=10.244.0.0/16  | tee clusterInit.txt.txt

    mkdir -p $HOME/.kube
    sudo cp -f /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config

    echo  $(fgrep join clusterInit.txt.txt | fgrep kubeadm) > joinCluster
    echo  $(fgrep discovery-token-ca-cert-hash clusterInit.txt.txt ) >> joinCluster
    chmod 775 joinCluster

    echo "Applying Flannel Network"
#    kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/62e44c867a2846fefb68bd5f178daf4da3095ccb/Documentation/kube-flannel.yml
     kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/2140ac876ef134e0ed5af15c65e414cf26827915/Documentation/kube-flannel.yml
else   
    echo "NOT RUNNING kubeadm"
fi

# if [[ "${COPY_KUBE_FILES}" =~ ^(y|Y|yes|true)$ ]] ; then

#     echo "Copying Kube-Config File to other nodes"

#     nodes=( "iron-hill-4.auristor.io" "iron-hill-5.auristor.io" "iron-hill-6.auristor.io" "iron-hill-7.auristor.io" )

#     for node in "${nodes[@]}"
#     do 
#         if [ "$(hostname)" != "$node" ]; then
#             echo "copying to: $node"

#             sshpass -p "$SSHP" scp $HOME/.kube/config     gerry@"$node":$HOME/.kube/config
#         else
#             echo "not copying to myself: $node"
#         fi
#         # or do whatever with individual element of the array
#     done
# else    
#     echo "Not Copying config files to Nodes"
# fi