#!/usr/bin/bash

date
set -x
az account set --subscription "LIS TEST"

time=`date +%Y%m%d%H%M%S`
alias="yourname"
deployName="$alias-rhel-cvm-"$time
resourceGroup="$alias-debug-rhel-"$time
vmName="$alias-rhel-cvm-"$time

az group create --name $resourceGroup --location "westus" || exit -1
az deployment group create -g $resourceGroup -n $deployName -f ./deployCPSCVM_customVHD.json -p ./azuredeploy.parameters.sample.json -p vmName=$vmName

echo result is: $?
set +x
date
