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

    run_opts="
    -i
    -t
    --rm
    --read-only
    --cap-drop     all
    --memory       100M
    --pids-limit   1000
    --cpu-shares   512
    "

    docker run ${run_opts} quay.io/jumanjiman/testssl -h

The above example uses `--read-only` and `--cap-drop all` as recommended by the
CIS Docker Security Benchmarks:

* [CIS Security Benchmark for Docker 1.6](https://benchmarks.cisecurity.org/tools2/docker/CIS_Docker_1.6_Benchmark_v1.0.0.pdf)
* [CIS Security Benchmark for Docker 1.11](https://benchmarks.cisecurity.org/tools2/docker/CIS_Docker_1.11.0_Benchmark_v1.0.0.pdf)
* [CIS Security Benchmark for Docker 1.12](https://benchmarks.cisecurity.org/tools2/docker/CIS_Docker_1.12.0_Benchmark_v1.0.0.pdf)
* [CIS Security Benchmark for Docker 1.13](https://benchmarks.cisecurity.org/tools2/docker/CIS_Docker_1.13.0_Benchmark_v1.0.0.pdf)


### Build and test images locally

On a host, such as devenv:

    # Optional. Your URL may vary.
    export DOCKER_HOST=tcp://192.168.254.162:2375

    # Build images.
    ci/build

    # Run the tests.
    ci/test


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
