#!/bin/bash

PIVNET_GH="https://api.github.com/repos/pivotal-cf/pivnet-cli/releases/latest"

DOWNLOAD_URL=$(curl -s $PIVNET_GH \
    | jq -r '.assets[] | select(.name | contains("linux-amd64")) | .browser_download_url')

echo "Downloading $DOWNLOAD_URL"
curl -sLO $DOWNLOAD_URL
