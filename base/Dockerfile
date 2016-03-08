FROM alpine

MAINTAINER Ilan G 

RUN apk update && apk upgrade \
  && apk add ca-certificates \
  && apk add bash \
  && rm -rf /var/cache/apk/*

ADD aliases.sh /etc/profile.d/
