#!/bin/bash

echo -e "\x1B[33mFETCHING\x1B[0m..."
git fetch
echo -e "\x1B[33mPULLING\x1B[0m..."
git pull
echo -e "\x1B[32mDONE!\x1B[0m"
