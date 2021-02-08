#!/bin/bash
set -e

echo "Starting build process..."

echo "Adding env variables..."
export PATH=/root/bin:$PATH

#Path to k8s config file
KUBECONFIG=/home/blockchain-automation-framework/build/config


echo "Running the playbook..."
exec ansible-playbook -vvvv /home/blockchain-automation-framework/platforms/hyperledger-fabric/configuration/chaincode-install-instantiate.yaml --inventory-file=/home/blockchain-automation-framework/platforms/shared/inventory/ -e "@/home/blockchain-automation-framework/build/network.yaml" -e 'ansible_python_interpreter=/usr/bin/python3' -e "add_new_org=false"