Test TLS/SSL of arbitrary services and ports
============================================

Build status for master branch: [![Circle CI](https://circleci.com/gh/jumanjihouse/docker-testssl/tree/master.svg?style=svg&circle-token=21344117bb3bc61b8096a1a1b76514ab7b8a3f85)](https://circleci.com/gh/jumanjihouse/docker-testssl/tree/master)

Docker image: https://quay.io/repository/jumanjiman/testssl

Docker source: https://github.com/jumanjihouse/docker-testssl

Upstream source: https://github.com/drwetter/testssl.sh


How-To
------

### Pull an already-built image

    docker pull quay.io/jumanjiman/testssl


### Run the image

    docker run --rm -it quay.io/jumanjiman/testssl -h


### Build and test images locally

On a host, such as devenv:

    # Optional. Your URL may vary.
    export DOCKER_HOST=tcp://192.168.254.162:2375

    # Build images.
    make build

    # Run the tests.
    make test


### Contribute

Fork [this repo](https://github.com/jumanjihouse/docker-testssl)
and see [CONTRIBUTING.md](CONTRIBUTING.md).


Operational status of SaaS providers
------------------------------------

CircleCI: [http://status.circleci.com/](http://status.circleci.com/)

Quay registry: [http://status.quay.io/](http://status.quay.io/)


License
-------

This repo, testssl, and openssl are licensed under the GPLv2.
See [LICENSE](LICENSE).
