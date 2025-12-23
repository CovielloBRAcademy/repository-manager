#!/bin/env bash

if [ -f .env ]
then
    echo ".env file exists, loading it"
    source .env
else
    echo "missing .env"
    exit 1
fi

if [ -z "${1}" ]
then
    echo "input 1 required - github repository"
    exit 1
fi

GITHUB_REPOSITORY="${1}"


if [ -z "${2}" ]
then
    echo "input 2 required - github owner"
    exit 1

fi

GITHUB_ONWER="${2}"

terraform init

# terraform apply -auto-approve -var="github_token=${GITHUB_TOKEN}" -var="github_repository_name=${GITHUB_REPOSITORY}" -var="github_owner=${GITHUB_ONWER}"
terraform destroy -auto-approve -var="github_token=${GITHUB_TOKEN}" -var="github_repository_name=${GITHUB_REPOSITORY}" -var="github_owner=${GITHUB_ONWER}"