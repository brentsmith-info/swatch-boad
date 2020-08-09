#!/bin/bash

#
# Enables Google Cloud APIs necessary for Ops Manager
#

gcloud services enable iam.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable dns.googleapis.com
gcloud services enable sql-component.googleapis.com
gcloud services enable compute.googleapis.com

