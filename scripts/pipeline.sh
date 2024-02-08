#!/usr/bin/env bash

THIS_DIR=$(dirname "${BASH_SOURCE[0]}")

cd "$THIS_DIR/.." || exit 1

if ! docker login \
    -u "$DOCKERHUB_USER" \
    -p "$DOCKERHUB_KEY" \
    docker.io \
    ;
then
    echo "Unable to login" 1>&2
    exit 1
fi

if ! ./scripts/build.sh --push cli alpine; then
    echo "Unable to build cli" 1>&2
    exit 1
fi

if ! ./scripts/build.sh --push lib alpine; then
    echo "Unable to build lib" 1>&2
    exit 1
fi

if ! docker logout; then
    echo "Unable to logout" 1>&2
fi

# EOF
