#!/bin/bash
if [ -d ~/.quantumx-installer ]; then
    echo "~/.quantumx-installer already exists."
    echo "Either delete the directory or run ~/.quantumx-installer/install.sh directly."  
    exit 1
fi
if which git > /dev/null 2>&1; then
    git clone https://github.com/johiruddinsultan/quantumx-installer ~/.quantumx-installer
    cd ~/.quantumx-installer/
else
    which wget > /dev/null 2>&1 && which unzip > /dev/null 2>&1 || { echo "Please install git or wget and unzip" && exit 1 ; }
    wget https://github.com/johiruddinsultan/quantumx-installer/archive/refs/heads/main.zip -O /tmp/quantumx-installer.zip
    unzip /tmp/quantumx-installer.zip -d ~/.quantumx-installer
    rm /tmp/quantumx-installer.zip
    cd ~/.quantumx-installer/quantumx-installer-main/ 
fi
if [[ $EUID -ne 0 ]]; then
    which sudo > /dev/null 2>&1 || { echo "You need to run this script as root" && exit 1 ; }
    sudo -H ./install.sh "$@"
else
    ./install.sh "$@"
fi


