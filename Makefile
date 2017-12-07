.PHONY: build run

DIR := $(shell pwd)

default: build

build: 
	docker build -t mtb-lohja/forum .

run: build
	docker run -p 8080:80 \
	  -v $(DIR)/data:/data \
	  -v $(DIR)/data/Attachments:/usr/local/apache2/htdocs/yabbfiles/Attachments \
	  -v $(DIR)/data/UserAvatars:/usr/local/apache2/htdocs/yabbfiles/avatars/UserAvatars \
	  -e DOMAIN=http://localhost:8080 \
	  mtb-lohja/forum
