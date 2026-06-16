#!/bin/bash

TARGETS=""

for resource in "$@"
do
  TARGETS="$TARGETS -target=$resource"
done

terraform apply $TARGETS --auto-approve


./deploy.sh aws_vpc.main aws_security_group.web_sg