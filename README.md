# MTB-Lohja forum

**Note:** This solution is not in use anymore; it was retired 1/2022 and now the old forum is included
as a static site within [mtb-lohja.com](https://mtb-lohja.com). The restricted, members-only forum also
exists as a zip archive and can be requested from Tero for viewing.

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

Use /scripts/create-instance-template.sh to create an instance template. There is an option --deploy to
immediately deploy the new group in further deployments.

Create health check (needed only once) with /scripts/create-health-check.sh

Finally create an instance group out of instance template and health check with /scripts/create-instance-group.sh

### Backup data

Backup cron job (disk snapshotting) is defined in a separate [Github repository](https://github.com/mtb-lohja/forum-backup).
