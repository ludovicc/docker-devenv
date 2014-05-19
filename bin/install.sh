#!/bin/bash
# options:
# --clean     : do not use Docker cache when building, this will refresh everything
# --no-update : skip updating the Docker images from Internet

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OPTS="-e master=true"

while :
do
    case $1 in
        -h | --help | -\?)
            #  Call your Help() or usage() function here.
            echo "Usage: ./install.sh [--clean] [--no-update]"
            echo "Options:"
            echo "  -c or --clean or --no-cache : do not use Docker cache when building, this will refresh everything"
            echo "  -N or --no-update : skip updating the Docker images from Internet"
            exit 0      # This is not an error, User asked help. Don't do "exit 1"
            ;;
        -c | --clean | --no-cache)
            OPTS="$OPTS -e docker_build_opts=--no-cache"
            shift
            ;;
        -N | --no-update)
            OPTS="$OPTS --skip-tags=update"
            shift
            ;;
        --) # End of all options
            shift
            break
            ;;
        -*)
            printf >&2 'WARN: Unknown option (ignored): %s\n' "$1"
            shift
            ;;
        *)  # no more options. Stop while loop
            break
            ;;
    esac
done

cd $DIR/../ansible-playbooks
ansible-playbook -vvvv -K $OPTS build.yml
