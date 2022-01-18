#!/bin/bash

echo 'ESLint Runner'
echo '(Prerequisites: node, npm)'

# Install ESLint
npm i --save-dev eslint > npm-eslint-install.log

# Install ESLint Dependencies
npm i --save-dev eslint-config-airbnb-base
npm i --save-dev eslint-plugin-import

# Lint
npx eslint ./ > npm-eslint.log