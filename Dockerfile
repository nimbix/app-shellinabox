FROM ubuntu:xenial
#FROM centos:7

# Update SERIAL_NUMBER to force rebuild of all layers (don't use cached layers)
ARG SERIAL_NUMBER
ENV SERIAL_NUMBER ${SERIAL_NUMBER:-20171117.2018}

ARG IMAGE_COMMON_BRANCH
ENV IMAGE_COMMON_BRANCH ${IMAGE_COMMON_BRANCH:-master}

ADD https://raw.githubusercontent.com/nimbix/image-common/$IMAGE_COMMON_BRANCH/install-nimbix.sh /tmp
RUN chmod 755 /tmp/install-nimbix.sh && \
    /tmp/install-nimbix.sh --image-common-branch $IMAGE_COMMON_BRANCH

ADD url.txt /etc/NAE/url.txt

