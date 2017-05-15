FROM openjdk:8-jdk-alpine

ENV HOME /home/jenkins
RUN addgroup jenkins \ 
    && addgroup docker \
    && adduser -S -h $HOME -G jenkins jenkins \
    && adduser jenkins docker

RUN apk add --no-cache \
		ca-certificates \
		curl \
		openssl \
		bash \
		git

# install jenkins slave
ARG VERSION=3.7

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar

# install docker client
ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 17.03.0-ce
ENV DOCKER_SHA256 4a9766d99c6818b2d54dc302db3c9f7b352ad0a80a2dc179ec164a3ba29c2d3e

RUN set -x \
	&& curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
	&& echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
	&& tar -xzvf docker.tgz \
	&& mv docker/* /usr/local/bin/ \
	&& rmdir docker \
	&& rm docker.tgz \
	&& docker -v

# install kubectl Linux
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod 755 kubectl \
    && mv kubectl /usr/local/bin/kubectl \
	&& kubectl version --client

COPY jenkins-slave /usr/local/bin/jenkins-slave

USER jenkins
RUN mkdir -p /home/jenkins/.jenkins
VOLUME /home/jenkins/.jenkins
WORKDIR /home/jenkins

USER root

ENTRYPOINT ["jenkins-slave"]
