# Collecting Docker Log Files with Fluentd and Elasticsearch
This directory contains the source files needed to make a Docker image
that collects Docker container log files using [Fluentd](http://www.fluentd.org/)
and sends them to an instance of [Elasticsearch](http://www.elasticsearch.org/).
This image is designed to be used as part of the [Kubernetes](https://github.com/kubernetes/kubernetes)
cluster bring up process. The image resides at DockerHub under the name
[kubernetes/fluentd-elasticsearch](https://registry.hub.docker.com/u/kubernetes/fluentd-elasticsearch/).

# What differs from the upstream
* Modify the plugin so that parsed time in milliseconds can be recorded.