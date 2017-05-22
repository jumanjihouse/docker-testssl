all: build test

.PHONY: build
build: base 2.8 2.9dev

.PHONY: base
base:
	@echo
	@echo '====> Build base image.'
	docker build -t testssl:base -f src/Dockerfile-base src/

.PHONY: 2.8
2.8:
	@echo
	@echo '====> Build image from branch "2.8".'
	docker build -t testssl:2.8 --build-arg BRANCH=2.8 -f src/Dockerfile src/

.PHONY: 2.9dev
2.9dev:
	@echo
	@echo '====> Build image from branch "2.9dev".'
	docker build -t testssl:2.9dev --build-arg BRANCH=2.9dev -f src/Dockerfile src/

.PHONY: test
test:
	@echo
	@echo '====> Test that images have correct versions.'
	docker run -it testssl:2.8    --version | grep '^[[:space:]]*testssl.sh.*2.8'
	docker run -it testssl:2.9dev --version | grep '^[[:space:]]*testssl.sh.*2.9dev'
	@echo '====> Test SSL of a website.'
	docker run -t testssl:2.8    --heartbleed --ip one https://www.google.com/
	docker run -t testssl:2.9dev --heartbleed --ip one https://www.google.com/
