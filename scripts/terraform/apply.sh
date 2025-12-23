#!/bin/env bash

cd terraform/

terraform apply -auto-approve -var="github_token=${GITHUB_TOKEN}" -var="github_repository_name=${GITHUB_REPOSITORY}" -var="github_owner=${GITHUB_ONWER}"

cd -