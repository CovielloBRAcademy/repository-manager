#!/bin/env bash

source ./scripts/utils/check_var.sh



source ./scripts/terraform/init.sh
source ./scripts/terraform/apply.sh

sleep 60

source ./scripts/terraform/destroy.sh
