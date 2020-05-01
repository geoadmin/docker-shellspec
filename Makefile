DOCKER := docker

.PHONY: help
help:
	@echo "Usage: make <target>"
	@echo
	@echo "Possible targets:"
	@echo "- build              Build the container"
	@echo ""

.PHONY: build
build:
	@echo "Build the dockerimage swisstopo/shellspec"
	${DOCKER} build -t swisstopo/shellspec .
