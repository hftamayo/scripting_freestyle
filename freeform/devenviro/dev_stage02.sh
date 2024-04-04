#!/bin/bash
echo "STAGE 2: PROGRAMMING LANGUAGE ENVIRO"
echo "Tools to be installed: nvm, node, python3, rust, golang, yarn, pnpm, java, maven, gradle"

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
echo "export PATH=$PATH:$gradle_dir/bin" >> ~/.bashrc

# Source the updated bash configuration (optional, but recommended for immediate use)
source ~/.bashrc


echo "verifying python and pip version:"
python3 --version
pip --version


echo "verifying java packages related:"
java --version
javac --version
maven --version
gradle --version
