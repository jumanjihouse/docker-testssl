all: build test

.PHONY: build
build: base master 2.6

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

.PHONY: 2.6
2.6:
	@echo
	@echo '====> Build image from branch "2.6".'
	docker build -t testssl:2.6 -f src/Dockerfile-2.6 src/

.PHONY: test
test:
	@echo
	@echo '====> Test that images have correct versions.'
	docker run -it testssl:master --version | grep '^[[:space:]]*testssl.sh'
	docker run -it testssl:2.6 --version | grep '^[[:space:]]*testssl.sh.*2.6'
	@echo '====> Test SSL of a website.'
	docker run -t testssl:2.6 https://members.ise.com
