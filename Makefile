CONTAINER := push-stream
IMAGE := rafaeleyng/$(CONTAINER)
IMAGE_TAGGED := $(IMAGE):latest
PORT_CONTAINER := 9080
PORT_HOST := 9080

.PHONY: docker-build
docker-build:
	@docker build \
		-t $(IMAGE) \
		.

.PHONY: docker-clean
docker-clean:
	@-docker rm -f $(CONTAINER)

.PHONY: docker-run
docker-run: docker-clean
	@docker run \
		-d \
		--name $(CONTAINER) \
		-p $(PORT_HOST):$(PORT_CONTAINER) \
		$(IMAGE_TAGGED)

.PHONY: docker-build-and-run
docker-build-and-run: docker-build docker-run

.PHONY: docker-push
docker-push: docker-build
	@docker push \
		$(IMAGE)
