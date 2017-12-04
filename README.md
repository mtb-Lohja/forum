# MTB-Lohja forum

This is the legacy forum that has run for over ten years at mtb-lohja.com converted to a Docker format. This benefits
any administrator as now running the forum is reproducible on any environment.

## Build & run

Copy your data folder contents to data/ (see data/README.md for details).

Build the image with `docker build -t mtb-lohja/forum .`. Then run the image 
with `docker run -p 8080:80 -v $(pwd)/data:/data mtb-lohja/forum`

## Migrate from traditionally hosted site

Rsync all files with their permissions:

    rsync -e 'ssh -i [ssh-file-location]' -ra myuser@myserver:/data ./data

Then copy the folders listed in /data/README.md to the folder. Upload to new hosting
as you wish (see below).

## Host on Google Cloud Platform

Showing a way to host this docker image as Google Cloud's Managed Instance Group. Keeping data at Google Cloud Buckets; albeit slow, they are more than enough for
this kind of seldom access use.

### Copy data to Google Cloud Buckets

In all the below examples using "mtb-lohja" as Google Cloud project name, and
mtb-lohja-forum-data as bucket name. Change these as you wish.

Create a cloud bucket to host the data:

    gsutil mb -p mtb-lohja -c regional -l europe-west1 gs://mtb-lohja-forum-data/

Prepare your own workstation with FUSE with [these instructions](https://cloud.google.com/storage/docs/gcs-fuse).

Map the bucket to your local disk.

    mkdir -p ~/mnt/mtb-lohja-forum-data
    gcsfuse mtb-lohja-forum-data ~/mnt/mtb-lohja-forum-data

Copy all of the data folder contents to the mounted disk

    cd data/
    cp -r * ~/mnt/mtb-lohja-forum-data

### Define a managed instance group

[Docs for the managed instance groups with Docker.](https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instance-templates/create-with-container)

    gcloud --project=mtb-lohja beta compute instance-templates create-with-container mtb-lohja-forum-1 \
      --container-image=gcr.io/mtb-lohja/forum:version-here \
      --container-mount-host-path=host-path=/mnt/data,mount-path=/data \
      --machine-type=f1-micro \
      --metadata=startup-script='sudo mkdir /mnt/data && sudo chmod a+w /mnt/data && gcsfuse --dir-mode "777" --file-mode "777" -o allow_other mtb-lohja-forum-data /mnt/data' \
      --address=??? \
      --region=europe-west1 \
      --scopes=default,storage-full

For Fuse mounting init script see [this example.](https://lemag.sfeir.com/wordpress-cluster-docker-google-cloud-platform/)