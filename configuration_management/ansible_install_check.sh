#!/bin/bash

echo "- Checking if Ansible is already installed..."

if command -v ansible >/dev/null 2>&1; then
    echo "Ansible is already installed. Version: $(ansible --version | head -n1)"
else
    echo "Ansible not found. Installing Ansible..."
    sudo apt update
    sudo apt install -y software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
    echo "Ansible installed successfully. Version: $(ansible --version | head -n1)"
fi
