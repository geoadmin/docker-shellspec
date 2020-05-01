DOCKER := docker

.PHONY: help
help:
	@echo "Usage: make <target>"
	@echo
	@echo "Possible targets:"
	@echo "- build              Build the container"
	@echo "- register           Register the container at dockerhub (credentials necessary)"
	@echo "- cleanall           Remove the virtualenv"
	@echo ""

.PHONY: build
build:
	@echo "Build the dockerimage swisstopo/shellspec"
	${DOCKER} build -t swisstopo/shellspec .
