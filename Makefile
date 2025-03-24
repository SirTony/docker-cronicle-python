TAG = ghcr.io/sirtony/cronicle:latest

build:
	docker build -t $(TAG) -f Dockerfile .

push:
	docker push $(TAG)
