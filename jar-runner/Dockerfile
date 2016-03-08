FROM shinyspiderdude/java8-with-takipi

MAINTAINER Ilan G 

RUN mkdir -p /opt/solaredge /var/log/solaredge

COPY startup.sh /opt/solaredge

EXPOSE 8080

CMD ["/bin/sh", "/opt/solaredge/startup.sh"]
