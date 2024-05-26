#!/usr/bin/env sh

set -e

echo "Checking gem dependencies"
bundle check || (
  echo "Installing missing gems"
  bundle install --jobs $(($(grep -c "cpu cores" < /proc/cpuinfo) - 1)) --retry 3
)

exec "$@"
