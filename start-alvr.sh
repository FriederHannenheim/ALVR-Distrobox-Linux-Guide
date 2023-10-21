#!/bin/bash
cd $(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

prefix="installation"
container_name="arch-alvr"

source ./helper-functions.sh
source ./links.sh
init_prefixed_installation "$@"
source ./setup-dev-env.sh "$prefix"

echog "Starting up Steam"
distrobox enter --name "$container_name" --additional-flags "--env XDG_CURRENT_DESKTOP=X-Generic --env LANG=en_US.UTF-8 --env LC_ALL=en_US.UTF-8" -- steam &>/dev/null &
echog "Starting up ALVR"
distrobox enter --name "$container_name" --additional-flags "--env XDG_CURRENT_DESKTOP=X-Generic --env LANG=en_US.UTF-8 --env LC_ALL=en_US.UTF-8" -- alvr_dashboard
