#!/bin/bash

env="demo"
action="plan"
while getopts 'e:a:' flag; do
  case "${flag}" in
	e) env=${OPTARG};;
  a) action=${OPTARG};;
  *) ;;
  esac
done

echo "Running ${action} on ${env} in region"
sleep 3

# terraform init -backend-config="config/sb-${env}.tfvars" --reconfigure
terraform fmt
terraform validate
terraform init
terraform ${action} -var-file="config/sb-${env}.tfvars"
