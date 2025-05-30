#!/usr/bin/env bash

# Make sure an argument was specified
if [[ -z $1 ]];
then
    echo "Usage: deploy command"
    echo "  Where command is one of:"
    echo "    all               brings all containers up "
    echo "    down              bring docker stack down"
    exit 1
fi

command=$1

set -euo pipefail  # stop on errors

if [ $command == "down" ]; then
    echo "Bringing docker stack down"
    docker-compose --profile all down --timeout 60
else

    if [ $command == "all" ]; then
        echo "Deploying all containers"
        chmod +x *.sh
        ./clean.sh
    fi

    echo "Bringing docker stack $command up"

    # Restart the containers and builds any that have a build specification, ignoring any errors while stopping the running container.
    docker-compose --profile $command down --timeout 60 | echo Ignoring errors...
    docker build --no-cache -f "httpd/Dockerfile" -t httpd:apsim httpd
    docker-compose --profile $command up -d 
fi
