#!/bin/bash

OWD=$PWD
cd jumpbox; terraform apply -auto-approve
cd $OWD