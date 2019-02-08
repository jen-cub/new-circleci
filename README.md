
# Planet 4 CircleCI build containers

[![CircleCI](https://circleci.com/gh/greenpeace/planet4-circleci/tree/develop.svg?style=shield)](https://circleci.com/gh/greenpeace/planet4-circleci)

Performs builds and tests for the Planet 4 web application and associated infrastructure

Supports automatic release versioning via CI commands on the develop branch.
To use, push a commit to github which contains a comment such as below:

```
# Creates a new release branch 'release/v1.2.3'
git commit -m "[ci tag v1.2.3]"

# Creates a new release branch 'release/v1.2.3-rc1'
git commit -m "[ci promote v1.2.3-rc1]"
```

The commands `ci promote`, `ci tag` and `ci release` are synonymous and interchangeable.

---

The base image builds upon the `circleci/php:7.0-node` image and adds:
-   [ag](https://github.com/ggreer/the_silver_searcher)
-   [bats](https://www.npmjs.com/package/bats) 1.1.0
-   [gcloud](https://cloud.google.com/sdk/docs/#install_the_latest_cloud_tools_version_cloudsdk_current_version) 232.0.0
-   [git-flow](https://github.com/petervanderdoes/gitflow-avh) 1.11.0
-   [hadolint](https://github.com/hadolint/hadolint) 1.16.0
-   [helm](https://github.com/kubernetes/helm) 2.12.3
-   [junit-merge](https://www.npmjs.com/package/junit-merge) 2.0.0
-   [shellcheck](https://github.com/koalaman/shellcheck) 0.6.0
-   [tap-xunit](https://github.com/aghassemi/tap-xunit) 2.3.0
-   [yamllint](https://pypi.org/project/yamllint) 1.14.0

Upstream images are [CircleCI build images](https://github.com/circleci/circleci-images/)

---

__Do not edit this file, make changes in the template file: `README.md.in`__
Build: https://circleci.com/gh/greenpeace/planet4-circleci/1358
