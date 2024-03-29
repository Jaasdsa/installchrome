#!/bin/sh
ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    apt-get update
    apt-get install -y wget gnupg ca-certificates
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub |  apt-key add -
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list
    apt-get update
    apt-get install -y google-chrome-stable
elif [ "$ARCH" = "arm64" ]; then
    apt-get update
    apt-get install -y wget gnupg ca-certificates
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub |  apt-key add -
    echo "deb [arch=arm64] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list
    apt-get update
    apt-get install -y google-chrome-stable
else
  echo "不支持的CPU架构: $ARCH"
fi
