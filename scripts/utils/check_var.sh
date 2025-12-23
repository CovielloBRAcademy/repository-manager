#!/bin/env bash

#
# Check Env
# 
if [ -f .env ]
then
    echo ".env file exists, loading it"
    source .env
else
    echo "missing .env"
    exit 1
fi

#
# Check input 1
#
if [ -z "${1}" ]
then
    echo "input 1 required - github repository"
    exit 1
fi
GITHUB_REPOSITORY="${1}"

#
# Check input 2
#
if [ -z "${2}" ]
then
    echo "input 2 required - github owner"
    exit 1

fi
GITHUB_ONWER="${2}"