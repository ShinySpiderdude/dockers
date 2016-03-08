FROM shinyspiderdude/glibc

MAINTAINER Ilan G 

ENV JAVA_HOME=/opt/jdk \
    PATH=${PATH}:/opt/jdk/bin \
    JAVA_VERSION=8 \
    JAVA_UPDATE=74 \
    JAVA_BUILD=02
    
RUN apk add --update curl && \
	mkdir /opt && \
	echo "Downloading java, hang on..." && \ 
	curl -sSL -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz | tar xz -C /opt && \
	ln -s /opt/jdk1.${JAVA_VERSION}.0_${JAVA_UPDATE} /opt/jdk && \
	apk del curl && \
        rm -rf /var/cache/apk/*
