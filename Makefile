IMAGE_NAME = "sparkfabrik/platform-cli:latest"
build:
	docker build -t $(IMAGE_NAME) .