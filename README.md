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

### TFJob/PytorchJob/MXJob/XGBoostJob/MPIJob

```bash
helm install plxtf polyaxon/trainingjobs --namespace=polyaxon
```
