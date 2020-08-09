#!/bin/bash

OWD=$PWD
cd jumpbox; terraform destroy -auto-approve
cd $OWD