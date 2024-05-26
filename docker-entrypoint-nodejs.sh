#!/usr/bin/env sh

set -e

echo "Checking npm dependencies"
npm install

exec "$@"
