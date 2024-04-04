#!/bin/bash
echo "STAGE 2: PROGRAMMING LANGUAGE ENVIRO"
echo "Tools to be installed: nvm, node, yarn, pnpm, python3, java, maven, gradle, rust, golang"

echo "Installing node ecosystem"
nvm_version="v0.39.7"
nvm_url="https://raw.githubusercontent.com/nvm-sh/nvm/$nvm_version/install.sh"
wget $nvm_url
chmod +x install.sh
./install.sh
nvm --version
node_target="20"
nvm install $node_target
nvm use $node_target
npm install --global npm
#pnpm
wget -qO- https://get.pnpm.io/install.sh | sh
#yarn
npm install --global yarn

echo "Installing python and pip version 3.x"
sudo apt install -y python3 python3-pip

echo "Installing OpenJDK: for diff version use: sudo update-alternatives --config java"
sudo apt install -y openjdk-21-jdk
sudo apt install maven
gradle_version="8.7"
gradle_url="https://services.gradle.org/distributions/gradle-$gradle_version-bin.zip"

# Download directory (you can change this if needed)
gradle_dir="/opt/gradle"

# Create the install directory (if it doesn't exist)
mkdir -p "$gradle_dir"

# Download the Gradle archive
wget -qO- "$gradle_url" | tar -xzf - -C "$gradle_dir"

# Set environment variable (modify if you prefer a different shell)
echo "export GRADLE_HOME=/opt/gradle-8.7/bin" >> ~/.bashrc
echo "export PATH=$PATH:$GRADLE_HOME" >> ~/.bashrc

# Source the updated bash configuration (optional, but recommended for immediate use)
source ~/.bashrc

echo "Installing rust: for updates|remove use: rustup update | rustup self uninstall"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

echo "Installing golang"
golang_version="1.22.2"
golang_url="https://go.dev/dl/go$golang_version.linux-amd64.tar.gz"
wget $golang_url
sudo tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin

echo "verifying nvm and node version"
nvm --version
node -v


echo "verifying python and pip version:"
python3 --version
pip --version


echo "verifying java packages related:"
java --version
javac --version
maven --version
gradle --version

echo "verifying rust installation"
rustc --version

echo "verifying go installation"
go version
