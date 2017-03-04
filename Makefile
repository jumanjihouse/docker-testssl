all: build test

.PHONY: build
build: base master

.PHONY: base
base:
	@echo
	@echo '====> Build base image.'
	docker build -t testssl:base -f src/Dockerfile-base src/

.PHONY: master
master:
	@echo
	@echo '====> Build image from branch "master".'
	docker build -t testssl:master -f src/Dockerfile-master src/

.PHONY: test
test:
	@echo
	@echo '====> Test that images have correct versions.'
	docker run -it testssl:master --version | grep '^[[:space:]]*testssl.sh'
	@echo '====> Test SSL of a website.'
	docker run -t testssl:master --ip one https://www.google.com/
