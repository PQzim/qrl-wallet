#!/bin/bash

# Cleans and rebuilds meteor

# Remove electrify artifacts
echo "Removing electrify artifacts"
rm -rf ./.electrify/app/
rm -rf ./.electrify/bin/
rm -rf ./.electrify/db/
rm -rf ./.electrify/node_modules/

# Remove meteor artifacts
echo "Removing meteor artifacts"
rm -rf ./node_modules/
rm -rf ./.eslintrc.js
rm -rf ./client/definitions/
rm -rf ./client/themes/
rm -rf ./client/semantic.less
rm -rf ./client/theme.import.less
rm -rf ./client/.custom.semantic.json
rm -rf ./client/theme.config.import.less
rm -rf ./version.desktop

# Install meteor dependencies
echo "Installing meteor dependencies"
meteor npm install
meteor npm install --save meteor-babel-helpers

echo "Installing electrify dependencies"
cd .electrify
npm install

cd ../

# Run meteor locally to build everything and we're done.
echo "Starting meteor for the first time"
meteor