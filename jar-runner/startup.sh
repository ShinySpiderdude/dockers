JAR=
JAVA_OPTS_CONF_COMMON="-Dcom.solaredge.config.confpath=/etc/solaredge/shared/configuration.xml -Dcom.solaredge.config.conflog4j=/etc/solaredge/common/log4j.xml -Dcom.solaredge.config.licensefile=/etc/solaredge/shared/license/license_solaredge.xml -Dcom.solaredge.config.confprop=/etc/solaredge/common/configuration_base.properties"
JAVA_OPTS_TAKIPI="-agentlib:TakipiAgent"
JAVA_OPTS_JMX="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=12124 -Dcom.sun.management.jmxremote.rmi.port=12124 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=$IP"
JAVA_OPTS=$JAVA_OPTS" "$JAVA_OPTS_CONF_COMMON" "$JAVA_OPTS_JMX

if [[ $DEBUG == "true" ]]; then
  JAVA_OPTS=$JAVA_OPTS" "$JAVA_OPTS_DEBUG
fi

if [[ $TAKIPI == "true" ]]; then
  /opt/takipi/etc/takipi-setup-machine-name ${SE_ENVIRONMENT}-${SE_PROFILE}-${IP}
  JAVA_OPTS=$JAVA_OPTS" "$JAVA_OPTS_TAKIPI
fi

. "/opt/solaredge/startup_extra.sh"

java $JAVA_OPTS -jar /opt/solaredge/solaredge-zuul.jar --spring.config.location=$CONFIG_LOCATION --logging.config=/etc/solaredge/common/logback.xml
