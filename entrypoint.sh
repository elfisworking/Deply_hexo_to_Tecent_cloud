#!/bin/bash

set -e
INPUT_CLOUD_SECRET_ID=$1
INPUT_CLOUD_SECRET_KEY=$2
INPUT_CLOUD_ENV_ID=$3



if [ -z "$INPUT_CLOUD_SECRET_ID" ]
then
    echo "You must provide your tencent secret id"
    exit 1
fi

if [ -z "$INPUT_CLOUD_SECRET_KEY" ]
then 
    ehco "You must provide your tencent secret key"
    exit 1
fi

if [ -z "$INPUT_CLOUD_ENV_ID" ]
then
    echo "You must provide your environment id"
fi

# Install hexo env
echo "Installing hexo-cli successfully"
npm install hexo-cli -g
echo "npm instal hexo-cli successfully"

# Install other dependencies
if [ ！ -f "packeage.json" ]
then
    echo "You must provide package.json file which help install dependencies"
    exit 1
fi
echo "Installing Other dependencies"
npm install 
echo "Other dependencies install successfully"

# Build hexo
echo "Building hexo"
hexo g
echo "Hexo build successfully"

# Install
echo "Install cloudbase/cli "
npm install -g @cloudbase/cli --loglevel=error 
echo "Cloudbase/cli install successfully"

# Login
cd public
echo "Login tcb"
tcb login --apiKeyId ${INPUT_CLOUD_SECRET_ID} --apiKey ${INPUT_CLOUD_SECRET_KEY}
echo "Tcb login successfully"

# Deploy
echo "Deploy successfully"
tcb hosting deploy ./ -e ${INPUT_CLOUD_ENV_ID}
echo "Deploy successfully"