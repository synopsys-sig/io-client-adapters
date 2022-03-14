#!/bin/bash

echo 'NPM Audit Runner'
echo '(Prerequisites: node, npm)'

# Audit
npm audit > npm-audit.log || true