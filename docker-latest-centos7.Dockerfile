FROM centos:centos7

ENV DOCKER_DEPS \
    yum-utils \
    device-mapper-persistent-data \
    lvm2

RUN yum -y --enablerepo=extras install epel-release && \
    yum groupinstall -y "Development Tools" && \
    yum install -y ${DOCKER_DEPS}

RUN curl -sSL https://get.docker.com/ | sh

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

VOLUME /var/lib/docker
CMD ["wrapdocker"]
