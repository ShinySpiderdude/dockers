FROM shinyspiderdude/java7-jdk

MAINTAINER Ilan G 

ENV MAVEN_VERSION=3.0.5

RUN apk add --update curl && \
	curl -sSL http://apache.mivzakim.net/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | tar xz -C /opt && \
	apk del curl && \
	ln -s /opt/apache-maven-${MAVEN_VERSION} /opt/maven && \
	rm -f /var/cache/apk/*

ENV PATH=$PATH:/opt/maven/bin

ENTRYPOINT ["/opt/maven/bin/mvn"]
