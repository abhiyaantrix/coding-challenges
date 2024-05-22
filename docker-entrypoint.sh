#!/usr/bin/env sh

set -e

echo "Checking gem dependencies"
bundle check \
  || (
    echo "Installing missing gems" \
      && bundle install --jobs $(expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1) --retry 3
  )

exec "$@"
