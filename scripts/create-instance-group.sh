#!/usr/bin/env bash

# Create instance group out of given instance template.
# Assumes gcloud tool is set up and authenticated against the project.
# Assumes health check has been created

# Just stop the script if any errors occur
set -e

project="mtb-lohja"
instance_group="mtb-lohja-forum"

tag=$1

if [ -z "$tag" ]; then
    >&2 echo "Usage:"
    >&2 echo "    $0 image-tag"
    >&2 echo ""
    >&2 echo "e.g. "
    >&2 echo "    $0 1.4"
    exit 1
fi

gcloud --project=$project beta compute instance-groups managed create "$instance_group" \
      --size=1 \
      --template="mtb-lohja-forum-${tag//./-}" \
      --zone=europe-west1-c \
      --http-health-check=mtb-lohja-forum-http
