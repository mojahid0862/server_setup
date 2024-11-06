#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or with sudo."
  exit 1
fi

echo "Updating package lists..."
apt-get update -y

echo "Installing curl if not present..."
apt-get install -y curl

echo "Adding 1GB swap memory..."

# Check if swapfile already exists
if swapon --show | grep -q '/swapfile'; then
  echo "Swapfile already exists."
else
  fallocate -l 1G /swapfile
  chmod 600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
  echo "Swap memory added."
fi

echo "Installing Node.js..."

# Check if Node.js is already installed
if command -v node &> /dev/null; then
  echo "Node.js is already installed."
else
  curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
  apt-get install -y nodejs
fi

echo "Installing Apache2..."

# Check if Apache2 is already installed
if command -v apache2 &> /dev/null; then
  echo "Apache2 is already installed."
else
  if apt-get install -y apache2; then
    echo "Apache2 installed successfully."
  else
    echo "Failed to install Apache2."
    exit 1
  fi
fi

echo "Installing PM2 globally..."

# Check if npm is installed
echo "Checking if npm is installed..."

if command -v npm &> /dev/null; then
  echo "npm is installed."
else
  echo "npm is not installed. Installing npm..."
  apt-get install -y npm
fi

# Ensure npm global bin directory is in PATH
echo "Ensuring npm global bin directory is in PATH..."

NPM_GLOBAL_BIN=$(npm bin -g)
if [[ ":$PATH:" != *":$NPM_GLOBAL_BIN:"* ]]; then
  echo "Adding $NPM_GLOBAL_BIN to PATH"
  export PATH="$PATH:$NPM_GLOBAL_BIN"
fi

# Check if PM2 is already installed
if command -v pm2 &> /dev/null; then
  echo "PM2 is already installed."
else
  echo "Installing PM2..."
  if npm install pm2@latest -g; then
    echo "PM2 installed successfully."
  else
    echo "Failed to install PM2."
    exit 1
  fi
fi

echo "All tasks completed successfully!"
