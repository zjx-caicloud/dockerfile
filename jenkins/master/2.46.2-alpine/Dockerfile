FROM jenkins:2.46.2-alpine

USER root
WORKDIR /var/jenkins_home

RUN install-plugins.sh kubernetes \ 
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
                       dashboard-view 
