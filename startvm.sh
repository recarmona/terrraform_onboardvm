#!/bin/bash

export TF_VAR_keyname=$LOGNAME
cd  deploy_vm
terraform apply -auto-approve
