#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#
# Exit on first error, print all commands.
set -e
export CHANNEL_NAME=ctochannel
export COMPOSE_PROJECT_NAME=ctocproject
docker-compose -f docker-compose.yml stop

# Shut down the Docker containers for the system tests.
docker-compose -f docker-compose.yml kill && docker-compose -f docker-compose.yml down

# remove chaincode docker images

docker rmi -f $(docker images -aq)
docker rm -f $(docker ps -aq)

# Your system is now clean
