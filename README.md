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