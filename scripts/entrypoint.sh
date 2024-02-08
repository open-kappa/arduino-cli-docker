#!/usr/bin/env bash

if [ "$1" == "bash" ]; then
    # shellcheck disable=SC2068
    exec $@
else
    # shellcheck disable=SC2068
    exec arduino-cli $@
fi

# EOF
