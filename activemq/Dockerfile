FROM shinyspiderdude/java8

MAINTAINER Ilan G 

ENV ACTIVEMQ_VERSION=5.8.0 \
	PATH=$PATH:/opt/activemq/bin

RUN apk add --update curl && \
	#curl -sSL http://apache.mivzakim.net/activemq/${ACTIVEMQ_VERSION}/apache-activemq-${ACTIVEMQ_VERSION}-bin.tar.gz | tar xz -C /opt && \
        curl -sSL http://archive.apache.org/dist/activemq/apache-activemq/${ACTIVEMQ_VERSION}/apache-activemq-${ACTIVEMQ_VERSION}-bin.tar.gz |tar xz -C /opt && \
	ln -s /opt/apache-activemq-${ACTIVEMQ_VERSION} /opt/activemq && \
	apk del curl && \
	rm -rf /opt/activemq/tmp/* \
			/opt/activemq/webapps-demo \
			/opt/activemq/bin/macosx \
			/opt/activemq/bin/linux-x86-32 \
			/opt/activemq/examples \
			/var/cache/apk/*

WORKDIR "/opt/activemq"

EXPOSE 61616 8161

CMD ["/opt/activemq/bin/activemq", "console" ]
