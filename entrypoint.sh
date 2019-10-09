#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /usr/src/budget_for_life/tmp/pids/server.pid

# Then exec the container's main process
exec "$@"
