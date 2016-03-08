FROM shinyspiderdude/java7-with-takipi

ENV TOMCAT_VERSION=6 \
	TOMCAT_UPDATE=44 \
	CATALINA_HOME=/usr/local/tomcat \
    PATH=$PATH:/usr/local/tomcat/bin

RUN apk add --update curl && \
    curl -sSL http://apache.spd.co.il/tomcat/tomcat-${TOMCAT_VERSION}/v${TOMCAT_VERSION}.0.${TOMCAT_UPDATE}/bin/apache-tomcat-${TOMCAT_VERSION}.0.${TOMCAT_UPDATE}.tar.gz | \
    	tar xz -C /usr/local && \
    ln -s /usr/local/apache-tomcat-${TOMCAT_VERSION}.0.${TOMCAT_UPDATE} ${CATALINA_HOME} && \
	apk del curl && \
	rm ${CATALINA_HOME}/conf/logging.properties && \
	rm -rf ${CATALINA_HOME}/webapps/* && \
	rm -rf /var/cache/apk/*

WORKDIR /usr/local/tomcat

COPY logback $CATALINA_HOME

EXPOSE 8080

cmd [ "bin/catalina.sh", "run" ]
