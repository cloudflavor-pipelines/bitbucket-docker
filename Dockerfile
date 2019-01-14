FROM openjdk:8-jre-slim

ARG BITBUCKET_VERSION=5.16.0

RUN apt-get update && \
    apt-get install -y wget procps git

RUN mkdir -p /bitbucket-home && \
    mkdir -p /bitbucket

RUN wget -q https://www.atlassian.com/software/stash/downloads/binary/atlassian-bitbucket-$BITBUCKET_VERSION.tar.gz -P /tmp && \
    tar -xvf /tmp/atlassian-bitbucket-$BITBUCKET_VERSION.tar.gz --strip-components=1 -C /bitbucket && \
    rm -rf /tmp/atlassian-bitbucket-$BITBUCKET_VERSION.tar.gz

RUN sed -i -e '/^assistive_technologies=/s/^/#/' /etc/java-*-openjdk/accessibility.properties

ENV BITBUCKET_HOME=/bitbucket-home
RUN umask 027

EXPOSE 7990
EXPOSE 7999

WORKDIR /bitbucket

RUN chown -R 10001:10001 /bitbucket && \
    chown -R 10001:10001 /bitbucket-home

VOLUME /bitbucket-home

USER 10001:10001

CMD ["/bitbucket/bin/start-bitbucket.sh", "-fg"]
