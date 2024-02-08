#!/usr/bin/env bash

THIS_DIR=$(dirname "${BASH_SOURCE[0]}")

PUSH="OFF"
if [ "$1" == "--push" ]; then
    PUSH="ON"
    shift
fi

SERVER="docker.io"
COMMAND="$1"
DISTRO="$2"
CLI_TAG="$3"
LIB_TAG="$4"

cd "$THIS_DIR/.." || exit 1

ENV_CLI_TAG=$(git describe --tags --abbrev=0 2>/dev/null | sed -e 's/^\([0-9\.]*\)-.*/\1/g')
ENV_LIB_TAG=$(git describe --tags --abbrev=0 2>/dev/null | sed -e 's/[0-9\.]*-lib//g')

if [ "$COMMAND" == "" ]; then
    echo "Missing cli argument: COMMAND" >&2
    exit 1
fi
if [ "$COMMAND" != "cli" ] && [ "$COMMAND" != "lib" ]; then
    echo "Invalid command: $COMMAND" >&2
    exit 1
fi
if [ "$DISTRO" == "" ]; then
    echo "Missing cli argument: DISTRO" >&2
    exit 1
fi
if [ "$CLI_TAG" == "" ]; then
    if [ "$ENV_CLI_TAG" == "" ]; then
        echo "Missing cli argument: CLI_TAG" >&2
        exit 1
    fi
    CLI_TAG="$ENV_CLI_TAG"
fi
if [ "$DISTRO" != "debian" ] && [ "$DISTRO" != "alpine" ]; then
    echo "Invalid distro: $DISTRO" >&2
    exit 1
fi
if [ "$LIB_TAG" == "" ]; then
    if [ "$ENV_LIB_TAG" == "" ] && [ "$COMMAND" == "lib" ]; then
        echo "Missing cli argument: LIB_TAG" >&2
        exit 1
    fi
    LIB_TAG="$ENV_LIB_TAG"
fi

shift
shift
shift
shift

echo "COMMAND: $COMMAND"
echo "DISTRO: $DISTRO"
echo "CLI_TAG: $CLI_TAG"
echo "LIB_TAG: $LIB_TAG"

IMAGE_TAG=""
DOCKERFILE=""
if [ "$COMMAND" == "lib" ]; then
    IMAGE_TAG="$SERVER/open-kappa/arduino-cli:$CLI_TAG-$DISTRO-lib$LIB_TAG"
    DOCKERFILE="lib"
else
    IMAGE_TAG="$SERVER/open-kappa/arduino-cli:$CLI_TAG-$DISTRO"
    DOCKERFILE="$DISTRO"
fi

#BUILDKIT_PROGRESS=plain \
#BUILDKIT_STEP_LOG_MAX_SIZE=1073741824 \
DOCKER_BUILDKIT=1 \
docker build \
    --no-cache \
    --tag "$IMAGE_TAG" \
    --build-arg "CLI_TAG=${CLI_TAG}" \
    --build-arg "DISTRO=${DISTRO}" \
    -f "Dockerfile.$DOCKERFILE" .
# shellcheck disable=SC2181
if [ "$?" != "0" ]; then
    echo "Error in build" >&2
    exit 1
fi

if [ "$PUSH" == "ON" ]; then
    docker push "$IMAGE_TAG"
fi

# EOF
