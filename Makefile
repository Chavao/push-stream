.PHONY: \
	build \
	run

IMAGE := "rafaeleyng/push-stream"

build:
	docker build -t rafaeleyng/push-stream .

run:
	docker run -d --name push-stream -p 9080:9080 $(IMAGE)

build-and-run: build run
