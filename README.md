[![License: Apache 2](https://img.shields.io/badge/License-apache2-green.svg)](LICENSE)
[![Helm Charts](https://github.com/polyaxon/charts/actions/workflows/charts.yml/badge.svg)](https://github.com/polyaxon/charts/actions/workflows/charts.yml)
[![Slack](https://img.shields.io/badge/chat-on%20slack-aadada.svg?logo=slack&longCache=true)](https://polyaxon.com/slack/)
[![Docs](https://img.shields.io/badge/docs-stable-brightgreen.svg?style=flat)](https://polyaxon.com/docs/)
[![GitHub](https://img.shields.io/badge/issue_tracker-github-blue?logo=github)](https://github.com/polyaxon/polyaxon/issues)
[![GitHub](https://img.shields.io/badge/roadmap-github-blue?logo=github)](https://github.com/polyaxon/polyaxon/milestones)

# Polyaxon-charts

Polyaxon charts is a set of Helm charts for creating reproducible and maintainable deployments of Polyaxon and it's components with Kubernetes.

This repo includes:

 * Helm chart for self-hosted Polyaxon version
 * Helm chart for Polyaxon agent to be deployed with Polyaxon cloud or Polyaxon EE
 * Helm charts for distributed training operators.


## Install

### Setup Helm

To install the platform, the agent, or the training operator make sure you have [Helm](https://helm.sh/docs/intro/install/) installed.

### Namespace

```bash
$ kubectl create namespace polyaxon

namespace "polyaxon" created
```

### Polyaxon charts repo

You can add the Polyaxon charts repo repository to your helm, so you can install Polyaxon and other charts provided by Polyaxon from it.
This makes it easy to refer to the chart without having to use a long URL each time.

```bash
$ helm repo add polyaxon https://charts.polyaxon.com
$ helm repo update
```

### TFJob/PytorchJob/MPIJob

To install the distributed training jobs:

```bash
helm install plxtj polyaxon/trainingjobs --namespace=polyaxon
```

## Deploying Polyaxon Agent to a Kubernetes namespace

The agent chart can be installed on a single node or on a multi-node cluster,
in which case you need to provide a volume with `ReadWriteMany` or a cloud bucket for the artifacts store.

For more information, please visit the docs for the [agent deployment](https://polyaxon.com/docs/setup/agent/).

## Deploying Polyaxon to a Kubernetes namespace

This platform chart can be installed on a single node or on a multi-node cluster,
in which case you need to provide a volume with `ReadWriteMany` or a cloud bucket for the artifacts store.

For more information, please visit the docs for the [platform deployment](https://polyaxon.com/docs/setup/platform/).

The platform chart bootstraps a [Polyaxon](https://polyaxon.com) deployment on
a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

It also packages a postgres dependency for Polyaxon (we recommend that you bring your own postgres instance instead of using the built-in subchart):

 * [PostgreSQL](https://github.com/kubernetes/charts/tree/master/stable/postgresql)

If you deploy the scheduler or deploy our enterprise version you will need Redis (we recommend that you bring your own postgres instance instead of using the built-in subchart):

 * [Redis](https://github.com/kubernetes/charts/tree/master/stable/redis)

## Uninstalling the Chart

To uninstall/delete the `<RELEASE_NAME>` deployment:

```bash
$ helm delete <RELEASE_NAME>
```

or with `--purge` flag

```bash
$ helm delete <RELEASE_NAME> --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.
