#!/bin/bash

# Exit on error
set -e

# Function to print messages
print_message() {
    echo "-----------------------------------"
    echo "$1"
    echo "-----------------------------------"
}

# Update the package index
print_message "Updating package index"
sudo apt-get update

# Install Docker
print_message "Installing Docker"

# Remove any old versions of Docker
sudo apt-get remove -y docker docker-engine docker.io containerd runc

# Install dependencies
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the Docker stable repository
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Verify Docker installation
sudo systemctl start docker
sudo systemctl enable docker
sudo docker --version

# Install Minikube
print_message "Installing Minikube"

# Download and install Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/

# Verify Minikube installation
minikube version

# Install kubectl
print_message "Installing kubectl"

# Download and install kubectl
curl -LO "https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Verify kubectl installation
kubectl version --client

print_message "Installation completed successfully!"

print_message "o guru ho ja suru"
