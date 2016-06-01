# Build rootfs for composer

build: build-fs
	@docker build -t imega/vigo .

build-fs:
	@docker run --rm \
		-v $(CURDIR)/runner:/runner \
		-v $(CURDIR)/build:/build \
		-v $(CURDIR)/src:/src \
		imega/base-builder:1.1.1 \
		--packages="busybox rsync inotify-tools unzip"

.PHONY: build
