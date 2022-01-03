#!/bin/bash

echo -e "\x1B[33mUPDATE\x1B[0m..."
apt update
echo -e "\x1B[33mUPGRADE\x1B[0m..."
apt upgrade --fix-missing -y
echo -e "\x1B[33mAUTOREMOVE\x1B[0m..."
apt autoremove -y
echo -e "\x1B[32mDONE!\x1B[0m"
