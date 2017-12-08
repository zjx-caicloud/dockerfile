#
# Copyright 2017 The Caicloud Authors.
#

FROM jenkins:2.60.3-alpine

USER root

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime && \
    /usr/local/bin/install-plugins.sh \ 
                       kubernetes \ 
                       workflow-aggregator \
                       pipeline-stage-view \
                       git \
                       credentials-binding \
                       ws-cleanup \
                       ant \
                       ldap \
                       email-ext \
                       simple-theme-plugin \
                       github-organization-folder \
                       ghprb \
                       subversion \
                       gitlab-plugin \
                       ansicolor \
                       dashboard-view \
                       build-timeout \
                       gitlab-hook

