# ops-manager

Shell and Terraform Scripts to set up TKGI Ops Manager

Based on: https://docs.pivotal.io/platform/ops-manager/2-8/gcp/prepare-env-terraform.html

## enable-apis.sh
Enables necessary APIs required for TKGI
| Command                          | Description                                                |
| -------------------------------- | ---------------------------------------------------------- |
| glcoud services list             | Shows current APIs enabled in active project               | 
| gcloud services list --available | Shows current APIs available to install to active project  |
| gcloud services enable <NAME>    | Enables API                                                |

## Step-By-Step
1. Create jumpbox by:
```
cd jumbpx
terraform apply
```
This will create a jumpbox to execute the remainder of the activities

2. ssh to the jumpbox with: `gcloud compute ssh tkgi@tkgi-jumpbox`