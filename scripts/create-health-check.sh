#!/usr/bin/env bash

# Create health check definition to be used with the instance group.
# Assumes gcloud tool is set up and authenticated against the project.

# Just stop the script if any errors occur
set -e

gcloud --project=mtb-lohja beta compute http-health-checks create mtb-lohja-forum-http \
        --check-interval=30s \
        --healthy-threshold=2 \
        --request-path=/cgi-bin/yabb2/YaBB.pl \
        --timeout=5s \
        --unhealthy-threshold=2