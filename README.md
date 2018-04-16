
# Planet 4 CircleCI build containers

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/4c9d5b08e9b046cbba9cdcbc9ba8eaf9)](https://www.codacy.com/app/rawalker/planet4-circleci?utm_source=github.com&utm_medium=referral&utm_content=greenpeace/planet4-circleci&utm_campaign=badger) [![CircleCI](https://circleci.com/gh/greenpeace/planet4-circleci/tree/master.svg?style=shield)](https://circleci.com/gh/greenpeace/planet4-circleci/tree/master)

Performs builds and tests for the Planet 4 web application and associated infrastructure

The base image builds upon the `circleci/php:7.0` image and adds:
-   [ack](https://beyondgrep.com/) 2.22
-   [bats](https://github.com/sstephenson/bats) latest
-   [docker-compose](https://github.com/docker/compose/releases) 1.21.0
-   [Google Cloud SDK](https://cloud.google.com/sdk/docs/#install_the_latest_cloud_tools_version_cloudsdk_current_version) 197.0.0
-   [Helm](https://github.com/kubernetes/helm/releases) 2.8.2
-   [junit-merge](https://www.npmjs.com/package/junit-merge)
-   [NodeJS](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)
-   [shellcheck](https://github.com/koalaman/shellcheck)
-   [tap-xunit](https://github.com/aghassemi/tap-xunit)
-   [Terraform](https://www.terraform.io/downloads.html) 0.11.4
-   [Terragrunt](https://github.com/gruntwork-io/terragrunt/releases) 0.14.2

Upstream images are [CircleCI build images](https://github.com/circleci/circleci-images/)

---

__Do not edit this file, make changes in the template file: `README.md.in`__
Build: https://circleci.com/gh/greenpeace/planet4-circleci/452
