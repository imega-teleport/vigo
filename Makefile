# Build rootfs for vigo

build: build-fs
	@docker build -t imegateleport/vigo .

push:
	@docker push imegateleport/vigo:latest

build-fs:
	@docker run --rm \
		-v $(CURDIR)/runner:/runner \
		-v $(CURDIR)/build:/build \
		-v $(CURDIR)/src:/src \
		imega/base-builder:1.1.1 \
		--packages="busybox rsync inotify-tools unzip"

.PHONY: build
