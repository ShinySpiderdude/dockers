FROM shinyspiderdude/glibc

MAINTAINER Ilan G 

ENV JAVA_HOME=/opt/jre \
    PATH=${PATH}:/opt/jre/bin \
    JAVA_VERSION=7 \
    JAVA_UPDATE=80 \
    JAVA_BUILD=15 \
    JAVA_TYPE=jre
    
RUN apk add --update curl && \
        mkdir /opt && \
        echo "Downloading java, hang on..." && \
        curl -sSL -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/${JAVA_TYPE}-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz | tar xz -C /opt && \
        ln -s /opt/${JAVA_TYPE}1.${JAVA_VERSION}.0_${JAVA_UPDATE} /opt/${JAVA_TYPE} && \
        apk del curl && \

    rm -rf /opt/jre/plugin \
           /opt/jre/bin/javaws \
           /opt/jre/bin/jjs \
           /opt/jre/bin/keytool \
           /opt/jre/bin/orbd \
           /opt/jre/bin/pack200 \
           /opt/jre/bin/policytool \
           /opt/jre/bin/rmid \
           /opt/jre/bin/rmiregistry \
           /opt/jre/bin/servertool \
           /opt/jre/bin/tnameserv \
           /opt/jre/bin/unpack200 \
           /opt/jre/lib/javaws.jar \
           /opt/jre/lib/deploy* \
           /opt/jre/lib/desktop \
           /opt/jre/lib/*javafx* \
           /opt/jre/lib/*jfx* \
           /opt/jre/lib/jfr* \
           /opt/jre/lib/amd64/libdecora_sse.so \
           /opt/jre/lib/amd64/libprism_*.so \
           /opt/jre/lib/amd64/libfxplugins.so \
           /opt/jre/lib/amd64/libglass.so \
           /opt/jre/lib/amd64/libgstreamer-lite.so \
           /opt/jre/lib/amd64/libjavafx*.so \
           /opt/jre/lib/amd64/libjfx*.so \
           /opt/jre/lib/ext/jfxrt.jar \
           /opt/jre/lib/ext/nashorn.jar \
           /opt/jre/lib/oblique-fonts \
           /opt/jre/lib/plugin.jar \
           /tmp/* \
           /var/cache/apk/*

#EXPOSE DEBUG AND JMX PORTS
EXPOSE 8000 12124

ENV JAVA_OPTS_DEBUG="-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n"
