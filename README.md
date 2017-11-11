Test TLS/SSL of arbitrary services and ports
============================================

Overview
--------

This repo provides docker images for `testssl.sh`,
a free command line tool to check a service
on any port for the support of TLS/SSL ciphers,
protocols, recent cryptographic flaws, and more.
Each image provides everything needed to run
`testssl.sh` the way upstream intends it to be run.

Build status for master branch: [![Circle CI](https://circleci.com/gh/jumanjihouse/docker-testssl/tree/master.svg?style=svg&circle-token=21344117bb3bc61b8096a1a1b76514ab7b8a3f85)](https://circleci.com/gh/jumanjihouse/docker-testssl/tree/master)<br/>
Docker image: https://quay.io/repository/jumanjiman/testssl<br/>
Docker source: https://github.com/jumanjihouse/docker-testssl<br/>
Upstream source: https://github.com/drwetter/testssl.sh<br/>

:warning: The **latest** tag at quay refers to the **stable** version.


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

    docker run ${run_opts} quay.io/jumanjiman/testssl --help

The above example uses `--read-only` and `--cap-drop all` as recommended by the
CIS Docker Security Benchmarks:

* [CIS Security Benchmark for Docker 1.6](https://benchmarks.cisecurity.org/tools2/docker/CIS_Docker_1.6_Benchmark_v1.0.0.pdf)
* [CIS Security Benchmark for Docker 1.11](https://benchmarks.cisecurity.org/tools2/docker/CIS_Docker_1.11.0_Benchmark_v1.0.0.pdf)
* [CIS Security Benchmark for Docker 1.12](https://benchmarks.cisecurity.org/tools2/docker/CIS_Docker_1.12.0_Benchmark_v1.0.0.pdf)
* [CIS Security Benchmark for Docker 1.13](https://benchmarks.cisecurity.org/tools2/docker/CIS_Docker_1.13.0_Benchmark_v1.0.0.pdf)


### Build and test images locally

:warning: All build configuration variables are in [`ci/build`](ci/build).

On a host, such as devenv:

    # Optional. Your URL may vary.
    export DOCKER_HOST=tcp://192.168.254.162:2375

    # Build images.
    ci/build

    # Run the tests.
    ci/test


### View labels

Each built image has labels that generally follow http://label-schema.org/

We add a label, `ci-build-url`, that is not currently part of the schema.
This extra label provides a permanent link to the CI build for the image.

View the ci-build-url label on a built image:

    docker inspect \
      -f '{{ index .Config.Labels "io.github.jumanjiman.ci-build-url" }}' \
      quay.io/jumanjiman/testssl

Query all the labels inside a built image:

    docker inspect quay.io/jumanjiman/testssl | jq -M '.[].Config.Labels'


### Contribute

Fork [this repo](https://github.com/jumanjihouse/docker-testssl)
and see [CONTRIBUTING.md](CONTRIBUTING.md).

:warning: All build configuration variables are in [`ci/build`](ci/build).


Operational status of SaaS providers
------------------------------------

CircleCI: [http://status.circleci.com/](http://status.circleci.com/)

Quay registry: [http://status.quay.io/](http://status.quay.io/)


License
-------

This repo, testssl, and openssl are licensed under the GPLv2.
See [LICENSE](LICENSE).
