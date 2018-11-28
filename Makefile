.PHONY: all

all: release

build: build_alpine
build_%:
	docker build --build-arg VERSION=$(VERSION) -t zkostrzewa/healthy:$(VERSION)-$* ./docker/$*

release: release_alpine
release_%:
	$(MAKE) build_$*
	$(MAKE) push_$*

push_%:
	docker login -u zkostrzewa
	docker push zkostrzewa/healthy:$(VERSION)-$*
	docker logout
