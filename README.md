# MTB-Lohja forum

This is the legacy forum that has run for over ten years at mtb-lohja.com converted to a Docker format. This benefits
any administrator as now running the forum is reproducible on any environment.

## Build & run

Copy your data folder contents to data/ (see data/README.md for details).

    # Build docker image
    make build

    # Build & run
    make run

See Makefile for details.

## Migrate from traditionally hosted site

Rsync all files with their permissions:

    rsync -e 'ssh -i [ssh-file-location]' -ra myuser@myserver:/data ./data

Then copy the folders listed in /data/README.md to the folder. Upload to new hosting
as you wish (see below).

## Host on Google Cloud Platform

Showing a way to host this docker image as Google Cloud's Managed Instance Group. Keeping data at Google Cloud
persistend disk.

### Copy data to GCE persistent disk

Create a persistent disk
    gcloud --project=mtb-lohja compute disks create mtb-lohja-forum-data \
        --size=1GB \
        --type=pd-standard \
        --zone=europe-west1-c

Attach the disk to any VM (can also be the VM below). Format the disk
[with these instructions](https://cloud.google.com/compute/docs/disks/add-persistent-disk#formatting).

Copy data to the disk with SCP, easiest way is to use [gcloud scp command](https://cloud.google.com/sdk/gcloud/reference/compute/scp).
E.g.:

    gcloud compute --project "mtb-lohja" scp --zone "europe-west1-c" data/* "mtb-lohja-forum-xw5l":/mnt/disks/data --recurse

### Define a managed instance group

[Overview docs about running Docker containers on GCE VM images (but not Kubernetes)](
https://cloud.google.com/compute/docs/containers/deploying-containers)

[Docs for the managed instance groups with Docker.](https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instance-templates/create-with-container)

    gcloud --project=mtb-lohja beta compute instance-templates create-with-container mtb-lohja-forum-3 \
      --container-image=gcr.io/mtb-lohja/forum:1.3 \
      --container-mount-host-path=host-path=/mnt/disks/data,mount-path=/data \
      --container-mount-host-path=host-path=/mnt/disks/Attachments,mount-path=/usr/local/apache2/htdocs/yabbfiles/Attachments \
      --container-mount-host-path=host-path=/mnt/disks/UserAvatars,mount-path=/usr/local/apache2/htdocs/yabbfiles/avatars/UserAvatars \
      --container-env=DOMAIN=http://foorumi.mtb-lohja.com,SENDGRID_API_KEY=replace-me-with-real-key \
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
      --address=35.189.248.107 \
      --tags=http-server \
      --region=europe-west1 \
      --scopes=default,storage-full

For Fuse mounting init script see [this example.](https://lemag.sfeir.com/wordpress-cluster-docker-google-cloud-platform/)

After the instance template has been created, create health check (needed only once):

    gcloud --project=mtb-lohja beta compute http-health-checks create mtb-lohja-forum-http \
        --check-interval=30s \
        --healthy-threshold=2 \
        --request-path=/cgi-bin/yabb2/YaBB.pl \
        --timeout=5s \
        --unhealthy-threshold=2

Finally create an instance group out of instance template and health check:

    gcloud --project=mtb-lohja beta compute instance-groups managed create mtb-lohja-forum \
      --size=1 \
      --template=mtb-lohja-forum-3 \
      --zone=europe-west1-c \
      --http-health-check=mtb-lohja-forum-http

