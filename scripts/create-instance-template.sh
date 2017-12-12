#!/usr/bin/env bash

# Create instance template.
# Assumes gcloud tool is set up and authenticated against the project.

# Just stop the script if any errors occur
set -e

project="mtb-lohja"
instance_group="mtb-lohja-forum"
ip="35.189.248.107"

tag=$1
sendgid_api_key=$2
deploy=$3

if [ -z "$tag" ] || [ -z "$sendgrid_api_key" ]; then
    >&2 echo "Usage:"
    >&2 echo "    $0 image-tag sendgrid-api-key [--deploy]"
    >&2 echo ""
    >&2 echo "e.g. "
    >&2 echo "    $0 1.4 98ausf9a8usf98aus9dfp8asp9fd8uas"
    exit 1
fi

template_name="mtb-lohja-forum-${tag//./-}"
echo "Creating template $template_name"

gcloud --project=$project beta compute instance-templates create-with-container "$template_name" \
      --container-image=gcr.io/mtb-lohja/forum:$tag \
      --container-mount-host-path=host-path=/mnt/disks/data,mount-path=/data \
      --container-mount-host-path=host-path=/mnt/disks/Attachments,mount-path=/usr/local/apache2/htdocs/yabbfiles/Attachments \
      --container-mount-host-path=host-path=/mnt/disks/UserAvatars,mount-path=/usr/local/apache2/htdocs/yabbfiles/avatars/UserAvatars \
      --container-env=DOMAIN=http://foorumi.mtb-lohja.com,SENDGRID_API_KEY=$sendgid_api_key \
      --disk=device-name=forum-data,mode=rw,name=mtb-lohja-forum-data \
      --machine-type=f1-micro \
      --metadata=^:^startup-script='#! /bin/bash
if [ -d /mnt/disks/data ]; then
    exit 0
fi
sudo mkdir /mnt/disks/data
sudo mount -o discard,defaults /dev/sdb /mnt/disks/data
sudo chmod a+w /mnt/disks/data
echo UUID=$(sudo blkid -s UUID -o value /dev/sdb) /mnt/disks/data ext4 discard,defaults,nofail 0 2 | sudo tee -a /etc/fstab
' \
      --address=$ip \
      --tags=http-server \
      --region=europe-west1 \
      --scopes=default,storage-full

if [ "$deploy" == "--deploy" ]; then 
    echo "Deploying template to the instance group $instance_group"

    gcloud --project=$project beta compute instance-groups managed set-instance-template "$instance_group" \
      --zone=europe-west1-c \
      --template="$template_name"

    echo "Restarting instance group to take new template into use"
    gcloud --project=$project beta compute instance-groups managed rolling-action replace "$instance_group" \
      --zone=europe-west1-c \
      --max-surge=0
fi