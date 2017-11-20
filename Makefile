.PHONY: build run

DIR := $(shell pwd)

default: build

build: 
	docker build -t mtb-lohja/forum .

run: 
	docker run -p 8080:80 -v $(DIR)/data:/data mtb-lohja/forum
